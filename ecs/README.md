ECS

Arch:
Cluster

Task Definition (equivalente a um Deployment)
Service (equivalente a um ReplicaSet)

Task
Container


1. Criar Cluster
- EC2
	- Auto scalling
	- ondemand / spot
	- s.o Linux
	- instancia (t2.micro)
	- desired (max / min)
	- ebs
- VPC
	- subnets private
- Security Group


2. Criar uma task definition
- EC2
- Linux
- Network mode: awsvpc
- Task size: cpu e memory
- Task role: IAM role
- Task execution role: IAM role
- Container: 
	- web
	- imagem
	- container port
	- resource limits - none
	- environment
	- log
	- health check
	- etc

3. Service (dentro do Cluster)
- Compute configuration 
	- Launch Type EC2
- Task definition
	- Family (task criada no passo anterior)
- Service Type
	- Replica 2
- Networking
	- VPC
	- Subnets Publicas
	- Security Group
	- Aplication Load Balancer
		- Listener