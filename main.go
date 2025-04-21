package main

import (
	"fmt"
	"log"
	"net"
	"os"
	"os/exec"
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

	backendAddr := os.Getenv("TCTXTO_PROXY_BA")
	if len(backendAddr) == 0 {
		backendAddr = fmt.Sprintf("%s:3232", localIP)
	}

	debugPort := os.Getenv("TCTXTO_PROXY_DP")
	if len(debugPort) == 0 {
		debugPort = "2121"
	}

	allowedOrigins := os.Getenv("TCTXTO_PROXY_AO")
	if len(allowedOrigins) == 0 {
		allowedOrigins = fmt.Sprintf("http://%s:2323", localIP)
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
