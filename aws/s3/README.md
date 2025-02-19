# Amazon S3

## Ref:
<https://aws.amazon.com/pt/s3/>

O Amazon Simple Storage Service (Amazon S3) é um serviço de armazenamento de objetos que oferece escalabilidade, disponibilidade de dados, segurança e performance líderes do setor. Clientes de todos os portes e setores podem armazenar e proteger qualquer quantidade de dados de praticamente qualquer caso de uso, como data lakes, aplicações nativas da nuvem e aplicações móveis. Com classes de armazenamento econômicas e recursos de gerenciamento fáceis de usar, você pode otimizar custos, organizar dados e configurar controles de acesso ajustados para atender a requisitos específicos de negócios, organizacionais e de conformidade.

## Custo
<https://aws.amazon.com/pt/s3/pricing/>

Você paga pelo armazenamento de objetos em buckets do S3. A taxa cobrada depende do tamanho do objeto, do tempo de armazenamento dos objetos durante o mês e da classe de armazenamento

## Classes de Armazenamento:
<https://aws.amazon.com/pt/s3/storage-classes/>

| Classe | Uso |
|--------|-----|
| S3 Standard | Armazenamento de uso geral para dados acessados com frequência |
| S3 Intelligent-Tiering | Economia automática de custos para dados com padrões de acesso desconhecidos ou variáveis |
| S3 Express One Zone | Armazenamento de alta performance para seus dados acessados com mais frequência |
| S3 Standard-IA | Dados acessados com pouca frequência que precisam de acesso em milissegundos |
| S3 One Zone-IA* | Dados recriáveis acessados com pouca frequência |
| 

## Amazon S3 Glacier
<https://aws.amazon.com/pt/s3/storage-classes/glacier/>

As classes de armazenamento do Amazon S3 Glacier são desenvolvidas especificamente para arquivamento de dados com a finalidade de oferecer a você a mais alta performance, a maior flexibilidade de recuperação e o armazenamento de arquivos de menor custo na nuvem. Todas as classes de armazenamento S3 Glacier fornecem escalabilidade virtualmente ilimitada e são projetadas para 99,999999999% (11 noves) de durabilidade de dados. As classes de armazenamento S3 Glacier oferecem opções para o acesso mais rápido aos seus dados de arquivo e o armazenamento de arquivo de menor custo na nuvem.

| Classe | Uso |
|--------|-----|
| S3 Glacier Instant Retrieval | Dados de longa duração que são acessados algumas vezes por ano com recuperações instantâneas |
| S3 Glacier Flexible Retrieval | Backup e arquivamento de dados que raramente são acessados e baixo custo |
| S3 Glacier Deep Archive | Arquivamento de dados que são raramente acessados e custo muito baixo |

## Terraform