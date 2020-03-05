// +build !release

package client

var (
	rootCrtPaths = []string{"assets/client/tls/ngrokroot.crt"}
)

// no server name in debug builds so that when you connect it will always work
func serverName(addr string) string {
	return ""
}
