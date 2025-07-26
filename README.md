# istio-chaos

### What It Is 

This repo contains the source for a custom fault that leverages Istio to inject latency into a Kubernetes microservice called "Frontend"  

### How It Works

The [inject.sh](https://github.com/shovanmaity/istio-chaos/blob/main/latency-helper/inject-latency.sh) script applies an [instrumented VirtualService Custom Resource](https://github.com/shovanmaity/istio-chaos/blob/main/latency-config/inject.yaml) to add latency to the frontend service. The Virtual service configuration is reverted 
after a predefined CHAOS_DURATION. 

### Motivation

For users who would like to leverage existing infrastructure, such as Istio, for fault injection (due to restrictions in allowing newer proxies or to facilitate the reuse of existing failure test scripts), this approach can be used. 

### How To Run As Harness Chaos Experiment

##### STEP-1: Containerize The Istio Latency Injection Logic 

Place the script and dependent artifacts in a container with an appropriate base image. Refer [Dockerfile](https://github.com/shovanmaity/istio-chaos/blob/main/latency-helper/Dockerfile)

##### STEP-2: Create A New Custom Fault On Harness Chaos Module

- Reference the image built in STEP-1 in the Fault Property `Lib Image`
- Add the command to be launched upon startup in the Fault Property `Command`
- Add the parameters (which will be added as environment variables on the business-logic "helper" pod running with the provided image)

<img width="1962" height="1262" alt="image" src="https://github.com/user-attachments/assets/4e4dfaad-60a4-471a-a3e6-6b428efcd999" />

##### STEP-3: Create An Appropriate Resilience Probe

##### STEP-4: Create A New Chaos Experiment With The Custom Fault & Probe










