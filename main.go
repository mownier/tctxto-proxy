package main

import (
	"fmt"
	"log"
	"net"
	"os"
	"os/exec"
	"strings"
)

func main() {
	localIP := ""

	addrs, err := net.InterfaceAddrs()
	if err != nil {
		log.Fatalf("error getting network interfaces: %v\n", err)
	}
	for _, addr := range addrs {
		if ipnet, ok := addr.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				localIP = ipnet.IP.String()
				break
			}
		}
	}

	if len(localIP) == 0 {
		log.Fatalln("unable to determine local IP")
	}

	emptyEnvVars := []string{}

	backendAddr := os.Getenv("TCTXTO_PROXY_BA")
	if len(backendAddr) == 0 {
		emptyEnvVars = append(emptyEnvVars, fmt.Sprintf("set environment variable TCTXTO_PROXY_BA (e.g. export TCTXTO_PROXY_BA=%s:3232)", localIP))
	}

	allowedOrigins := os.Getenv("TCTXTO_PROXY_AO")
	if len(allowedOrigins) == 0 {
		emptyEnvVars = append(emptyEnvVars, fmt.Sprintf("set environment variable TCTXTO_PROXY_AO (e.g. export TCTXTO_PROXY_AO=http://%s:2323)", localIP))
	}

	if len(emptyEnvVars) > 0 {
		log.Fatalf("encountered problem(s): %s\n", strings.Join(emptyEnvVars, ", "))
	}

	debugPort := os.Getenv("TCTXTO_PROXY_DP")
	if len(debugPort) == 0 {
		debugPort = "2121"
	}

	log.Printf("tctxto proxy running on http://%s:%s\n", localIP, debugPort)

	cmd := exec.Command(grpcWebProxyExecutable,
		"--run_tls_server=false",
		fmt.Sprintf("--backend_addr=%s", backendAddr),
		fmt.Sprintf("--server_http_debug_port=%s", debugPort),
		fmt.Sprintf("--allowed_origins=%s", allowedOrigins),
	)

	output, err := cmd.CombinedOutput()
	if err != nil {
		log.Fatalf("error running grpcwebproxy: %+v\n", err)
	}

	log.Printf("output: %+v\n", output)
}
