SHELL := /bin/bash

export PROJECT=$(shell cat config.json | jq .project)

init:
	terraform init

plan:
	terraform plan -var="project=$(PROJECT)"

apply:
	terraform apply -var="project=$(PROJECT)"
