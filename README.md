NOTESS:

- Kendi hesabımızın credentiallarını aldık.
- EC2 oluşturuyoruz
  - ubuntu AMI
  - Free tier'a uygun birşey yaptık. public IP4 falan verdi (WOW)
  - Buradaki AMI denilen birşey var. Snapshot finger print gibi birşey ellam
  - parametre olarak kullanabiliyoruz, hardcoded olarak da yapabiliyoruz.
  - resource "aws_instance" (EC2 oluyor)
  - AMI region'a göre değişiyor. Aynı image farklı region'da farklı ami'lere sahip...
  - terraform init yaptık. aws ile alakalı birşeyelr yükledi. (Installing hashicorp/aws v5.11.0...)
  - 
