module github.com/pravega/zookeeper-operator

go 1.16

require (
	github.com/ghodss/yaml v1.0.0
	github.com/go-logr/logr v1.4.2
	github.com/onsi/ginkgo v1.16.5
	github.com/onsi/gomega v1.34.1
	github.com/pkg/errors v0.9.1
	github.com/samuel/go-zookeeper v0.0.0-20201211165307-7117e9ea2414
	github.com/sirupsen/logrus v1.9.3
	k8s.io/api v0.31.0
	k8s.io/apimachinery v0.31.0
	k8s.io/client-go v0.31.0
	sigs.k8s.io/controller-runtime v0.19.0
)

replace (
	github.com/go-logr/zapr => github.com/go-logr/zapr v0.4.0

	k8s.io/api => k8s.io/api v0.19.13

	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.19.13

	k8s.io/apimachinery => k8s.io/apimachinery v0.19.14-rc.0

	k8s.io/apiserver => k8s.io/apiserver v0.19.13

	k8s.io/cli-runtime => k8s.io/cli-runtime v0.19.13

	k8s.io/client-go => k8s.io/client-go v0.19.13

	k8s.io/cloud-provider => k8s.io/cloud-provider v0.19.13

	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.19.13

	k8s.io/code-generator => k8s.io/code-generator v0.19.14-rc.0

	k8s.io/component-base => k8s.io/component-base v0.19.13

	k8s.io/controller-manager => k8s.io/controller-manager v0.19.14-rc.0

	k8s.io/cri-api => k8s.io/cri-api v0.19.14-rc.0

	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.19.13

	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.19.13

	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.19.13

	k8s.io/kube-proxy => k8s.io/kube-proxy v0.19.13

	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.19.13

	k8s.io/kubectl => k8s.io/kubectl v0.19.13

	k8s.io/kubelet => k8s.io/kubelet v0.19.13

	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.19.13

	k8s.io/metrics => k8s.io/metrics v0.19.13

	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.19.13

	k8s.io/sample-cli-plugin => k8s.io/sample-cli-plugin v0.19.13

	k8s.io/sample-controller => k8s.io/sample-controller v0.19.13
)
