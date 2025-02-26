# AWS EC2 - Elastic Compute Cloud


## Ref:
<https://aws.amazon.com/pt/ec2/>\
<https://aws.amazon.com/pt/ec2/pricing/>\
<https://aws.amazon.com/pt/ec2/getting-started/>


O Amazon Elastic Compute Cloud (Amazon EC2) oferece a plataforma de computação mais ampla e aprofundada, com mais de 750 instâncias e opções de processadores, armazenamentos, redes, sistemas operacionais e modelos de compras mais recentes para ajudar você a atender melhor às necessidades da sua workload. Somos o primeiro grande provedor de nuvem a oferecer suporte para processadores Intel, AMD e Arm, a única nuvem com instâncias Mac do EC2 sob demanda e a única nuvem com redes Ethernet de 400 Gbps. Oferecemos a melhor performance de preço para treinamento de machine learning, bem como o menor custo por instâncias de inferência na nuvem. Mais workloads SAP, computação de alta performance (HPC), ML e Windows são executadas na AWS do que qualquer outra nuvem.

## Custo

- On-demand
- Spot
- Saving Plans
- Reservas
- Hosts dedicados

## Componentes

- Instâncias
- Imagens (AMI)
- EBS (Volumes)

- Security Groups
- IPs Elasticos
- Balanceamento de Carga

- Auto Scaling


## Instâncias

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/concepts.html>

O Amazon Elastic Compute Cloud (Amazon EC2) oferece uma capacidade de computação escalável sob demanda na Nuvem Amazon Web Services (AWS). O uso do Amazon EC2 reduz os custos de hardware para que você possa desenvolver e implantar aplicações com mais rapidez. É possível usar o Amazon EC2 para executar quantos servidores virtuais forem necessários, configurar a segurança e as redes e gerenciar o armazenamento. É possível adicionar capacidade (aumentar a escala verticalmente) para lidar com tarefas de computação pesada, como processos mensais ou anuais ou picos no tráfego do site. Quando o uso diminui, você pode reduzir a capacidade (reduzir a escala verticalmente) de novo.

Uma instância do EC2 é um servidor virtual na Nuvem AWS. Quando executa uma instância do EC2, o tipo de instância que você especifica determina o hardware disponível para sua instância. Cada tipo de instância oferece um equilíbrio diferente entre recursos de computação, memória, armazenamento e rede. 

![instance](instance-types.png)

### Userdata

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/user-data.html>

Execute comandos (scripts) na primeira inicialização do Servidor.

```
#!/bin/bash
yum install -y nginx
systemctl enable nginx
systemctl start nginx
echo Hello World! > /usr/share/nginx/html/index.html
echo $(hostname -s) >> /usr/share/nginx/html/index.html
```

### Preços

<https://aws.amazon.com/pt/ec2/pricing/on-demand/>


### Criar uma instância

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/EC2_GetStarted.html>

## Imagens

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/AMIs.html>

Uma Imagem de máquina da Amazon (AMI) é uma imagem que fornece o software necessário para configurar e inicializar uma instância do Amazon EC2. Cada AMI também contém um mapeamento de dispositivos de blocos que especifica os dispositivos de blocos a serem anexados às instâncias que você executa. Especifique uma AMI ao iniciar uma instância. Essa AMI deve ser compatível com o tipo de instância que você escolhe para a sua instância. Você pode usar uma AMI fornecida pela AWS, uma AMI pública, uma AMI que alguém compartilhou com você ou uma AMI que você comprou no AWS Marketplace.

Uma AMI é específica para o seguinte:

- Região
- Sistema operacional
- Arquitetura do processador
- Tipo de dispositivo raiz
- Tipo de virtualização

É possível iniciar várias instâncias em uma única AMI quando precisar de várias instâncias com a mesma configuração. Você pode usar AMIs diferentes para executar instâncias quando precisar de instâncias com configurações diferentes

### Encontrar uma AMI:
<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/finding-an-ami.html>

```
aws ec2 describe-images --owners amazon
```
```
--filters "Name=platform,Values=windows"
```

### Criar uma AMI

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ami-lifecycle.html>

Comece com uma AMI existente, inicie uma instância, personalize-a, crie uma nova AMI a partir dela e, por fim, inicie uma instância de sua nova AMI.

## EBS - Elastic Block Store

<https://docs.aws.amazon.com/pt_br/ebs/latest/userguide/what-is-ebs.html>\
<https://docs.aws.amazon.com/pt_br/ebs/latest/userguide/ebs-volume-types.html>

O Amazon Elastic Block Store (Amazon EBS) fornece recursos de armazenamento em blocos escaláveis e de alto desempenho que podem ser usados com instâncias do Amazon EC2. 

Um volume do Amazon EBS é um dispositivo de armazenamento em blocos durável que é possível anexar às suas instâncias. Depois de anexar um volume a uma instância, será possível usá-lo como você usaria um disco rígido físico. Os volumes do EBS são flexíveis. Para volumes de geração atual anexados a tipos de instância de geração atual, é possível aumentar o tamanho dinamicamente, modificar a capacidade de IOPS provisionadas e alterar o tipo de volume em volumes de produção em tempo real.

É possível usar os volumes do EBS como armazenamento principal de dados que exigem atualizações frequentes, como o drive do sistema para uma instância ou armazenamento de uma aplicação de banco de dados. Também é possível usá-los para aplicações com muita throughput que executam verificações de disco contínuas. Os volumes do EBS persistem independentemente da vida útil de uma EC2 instância.

É possível anexar vários volumes do EBS a uma única instância. O volume e a instância devem estar na mesma zona de disponibilidade. Dependendo do volume e dos tipos de instância, você pode usar a opção Anexar várias para montar um volume em várias instâncias ao mesmo tempo.

O Amazon EBS fornece os seguintes tipos de volumes: SSD de uso geral (gp2 e gp3), SSD de IOPS provisionadas (io1 e io2), HDD otimizado para throughput (st1), HDD a frio (sc1) e Magnético (standard). Eles diferem em características de performance e preço, permitindo que você adapte a performance e custo de armazenamento às necessidades das aplicações.

### Preços

<https://aws.amazon.com/pt/ebs/pricing/>

### Criar um Volume

<https://docs.aws.amazon.com/pt_br/ebs/latest/userguide/ebs-volume-lifecycle.html>

Você pode criar um volume vazio ou criar um volume a partir de um snapshot do Amazon EBS. Se você criar um volume a partir de um snapshot, o volume começará como uma réplica exata do volume que foi usado para criar o snapshot.

<https://docs.aws.amazon.com/pt_br/ebs/latest/userguide/ebs-attaching-volume.html>\
<https://docs.aws.amazon.com/pt_br/ebs/latest/userguide/ebs-volumes-multi.html>


## Security Groups

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ec2-security-groups.html>\
<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/creating-security-group.html>

Um grupo de segurança atua como firewall virtual para as instâncias do EC2 visando controlar o tráfego de entrada e de saída. As regras de entrada controlam o tráfego de entrada para a instância e as regras de saída controlam o tráfego de saída da instância. Ao executar sua instância, é possível especificar um ou mais grupos de segurança. Se você não especificar um grupo de segurança, o Amazon EC2 usará o grupo de segurança padrão para a VPC. Depois de executar uma instância, é possível alterar seus grupos de segurança.


## IPs Elásticos

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html>

Um Endereço IP elástico é um endereço IPv4 estático projetado para computação em nuvem dinâmica. Um endereço IP elástico é alocado para a conta da AWS e será seu até que você o libere. Com um endereço IP elástico, é possível mascarar a falha de uma instância ou software remapeando rapidamente o endereço para outra instância na conta. Como alternativa, é possível especificar o endereço IP elástico em um registro DNS para o seu domínio, para que ele acione a sua instância. 

### Preços 

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#eip-pricing>\
<https://aws.amazon.com/pt/vpc/pricing/>


### Alocar um IP Elastíco

<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/working-with-eips.html#using-instance-addressing-eips-allocating>\
<https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/working-with-eips.html>


## Balanceamento de Carga

<https://docs.aws.amazon.com/pt_br/elasticloadbalancing/latest/userguide/what-is-load-balancing.html>

O Elastic Load Balancing distribui automaticamente seu tráfego de entrada em vários destinos, como EC2 instâncias, contêineres e endereços IP, em uma ou mais zonas de disponibilidade. Ele monitora a integridade dos destinos registrados e roteia o tráfego apenas para os destinos íntegros. O Elastic Load Balancing escalona automaticamente sua capacidade de balanceador de carga em resposta a mudanças ao tráfego de entrada.

O Elastic Load Balancing é compatível com os seguintes tipos de balanceadores de carga:

- Application Load Balancers
- Network Load Balancers
- Balanceadores de carga de gateway
- Classic Load Balancers

<https://docs.aws.amazon.com/pt_br/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html>


### Preços

<https://aws.amazon.com/pt/elasticloadbalancing/pricing/>

### Criar um Balanceador de Carga

<https://docs.aws.amazon.com/pt_br/elasticloadbalancing/latest/userguide/load-balancer-getting-started.html>\
<https://docs.aws.amazon.com/pt_br/elasticloadbalancing/latest/application/application-load-balancer-getting-started.html>

#### Grupo de Destino

Crie um grupo de destino, que é usado no roteamento da solicitação. A regra padrão para o seu listener roteia solicitações para os destinos registrados neste grupo de destino. O load balancer verifica a integridade dos destinos desse grupo de destino usando as configurações de verificação de integridade definidas para o grupo de destino.

#### Defina o tipo de balanceador de carga

O Elastic Load Balancing oferece suporte para diferentes tipos de balanceadores de carga, exemplo: Application Load balancer.

#### Defina as Zonas e Subnets e Security Groups

#### Defina as regras de Listener e Associe o Grupo de Destino


## Auto Scaling

<https://aws.amazon.com/pt/ec2/autoscaling/>\
<https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html>

O Amazon EC2 Auto Scaling ajuda você a garantir que você tenha o número correto de EC2 instâncias da Amazon disponíveis para lidar com a carga do seu aplicativo. Você cria coleções de EC2 instâncias, chamadas de grupos de Auto Scaling. Você pode especificar o número mínimo de instâncias em cada grupo de Auto Scaling, e o Amazon Auto EC2 Scaling garante que seu grupo nunca fique abaixo desse tamanho. Você pode especificar o número máximo de instâncias em cada grupo de Auto Scaling, e o Amazon Auto EC2 Scaling garante que seu grupo nunca ultrapasse esse tamanho. Se você especificar a capacidade desejada, ao criar o grupo ou a qualquer momento posterior, o Amazon EC2 Auto Scaling garante que seu grupo tenha esse número de instâncias. Se você especificar políticas de escalabilidade, o Amazon EC2 Auto Scaling poderá iniciar ou encerrar instâncias à medida que a demanda em seu aplicativo aumentar ou diminuir.

### Preços

Não há taxas adicionais com o Amazon EC2 Auto Scaling, então é fácil testá-lo e ver como ele pode beneficiar sua AWS arquitetura. Você paga somente pelos AWS recursos (por exemplo, EC2 instâncias, volumes do EBS e CloudWatch alarmes) que você usa.

### Criar um Grupo de Auto Scaling

<https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/create-your-first-auto-scaling-group.html>


## Terraform