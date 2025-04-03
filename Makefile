
build:
	helm package code/*
	mv *.tgz charts
	helm repo index --url https://godq.github.io/helm-charts/ .

use:
	helm repo remove godq-charts || true
	helm repo add godq-charts https://godq.github.io/helm-charts
	helm repo update
	helm search repo godq-charts -l --devel | grep confluent