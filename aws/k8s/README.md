# EKS - Elastic Kubernetes Service

O Amazon Elastic Kubernetes Service (Amazon EKS) é um serviço gerenciado de Kubernetes que facilita a execução do Kubernetes na AWS e em ambientes on-premises. O Kubernetes é um sistema de código aberto com a finalidade de automatizar a implantação, a escalabilidade e o gerenciamento de aplicações conteinerizadas. A conformidade do Amazon EKS com o Kubernetes é certificada. Portanto, as aplicações existentes executadas no upstream do Kubernetes são compatíveis com o Amazon EKS.

O Amazon EKS gerencia automaticamente a disponibilidade e a escalabilidade dos nós do ambiente de gerenciamento do Kubernetes, que são responsáveis por programar contêineres, gerenciar a disponibilidade das aplicações, armazenar dados de cluster e outras tarefas principais.

O Amazon EKS permite executar suas aplicações do Kubernetes no Amazon Elastic Compute Cloud (Amazon EC2) e no AWS Fargate. Com o Amazon EKS, é possível aproveitar toda a performance, a escala, a confiabilidade e a disponibilidade da infraestrutura da AWS, assim como as integrações com os serviços de segurança e de redes da AWS, como balanceadores de carga da aplicação (ALBs) para distribuição de carga, integração do AWS Identity and Access Management (IAM) com o controle de acesso baseado em função (RBAC) e suporte à AWS Virtual Private Cloud (VPC) para redes de pod.

## Ref:
<https://aws.amazon.com/pt/eks/>\
<https://aws.amazon.com/pt/eks/features/>
<https://aws.amazon.com/pt/eks/pricing/>\
<https://docs.aws.amazon.com/pt_br/eks/latest/userguide/create-kubeconfig.html>


## Terraform

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster>

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group>

<https://registry.terraform.io/providers/-/aws/latest/docs/resources/eks_access_entry>