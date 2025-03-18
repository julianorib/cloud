## Auto Scaling

<https://aws.amazon.com/pt/ec2/autoscaling/>\
<https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html>

O Amazon EC2 Auto Scaling ajuda você a garantir que você tenha o número correto de EC2 instâncias da Amazon disponíveis para lidar com a carga do seu aplicativo. Você cria coleções de EC2 instâncias, chamadas de grupos de Auto Scaling. Você pode especificar o número mínimo de instâncias em cada grupo de Auto Scaling, e o Amazon Auto EC2 Scaling garante que seu grupo nunca fique abaixo desse tamanho. Você pode especificar o número máximo de instâncias em cada grupo de Auto Scaling, e o Amazon Auto EC2 Scaling garante que seu grupo nunca ultrapasse esse tamanho. Se você especificar a capacidade desejada, ao criar o grupo ou a qualquer momento posterior, o Amazon EC2 Auto Scaling garante que seu grupo tenha esse número de instâncias. Se você especificar políticas de escalabilidade, o Amazon EC2 Auto Scaling poderá iniciar ou encerrar instâncias à medida que a demanda em seu aplicativo aumentar ou diminuir.

### Preços

Não há taxas adicionais com o Amazon EC2 Auto Scaling, então é fácil testá-lo e ver como ele pode beneficiar sua AWS arquitetura. Você paga somente pelos AWS recursos (por exemplo, EC2 instâncias, volumes do EBS e CloudWatch alarmes) que você usa.

### Criar um Grupo de Auto Scaling

<https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/create-your-first-auto-scaling-group.html>

Será necessário criar um "Modelo de Execução".\
Um modelo de execução que especifica o tipo de EC2 instância que o Amazon EC2 Auto Scaling cria para você. Inclua informações, como o ID da imagem de máquina da Amazon (AMI) a ser usada, o tipo de instância, o par de chaves e os grupos de segurança.


## Terraform

[HandsOn](https://developer.hashicorp.com/terraform/tutorials/aws/aws-asg?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)

### Resource: aws_launch_template

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template>

### Resource: aws_autoscaling_group

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group>

### Resource: aws_autoscaling_attachment

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment>