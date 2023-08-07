https://www.youtube.com/watch?v=SLB_c_ayRMo
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

- EC2 -> Key pairs -> Create
  - pem is for mac-linux
  - ppk is for windows. But it is convertable to pem
  - let's download pem
  - install putty into you pc
  - puttygen will be installed with it. It can generate ppk from pem
  - OR you can run ssh code with. `ssh -i mykey.pem user@mydomain.example`

# Birşeyler daha yaptı abimiz

- subnet için availabilty zone vermemiz kıymetli. Ve bu zone değerleri region + 'a' | 'b' | 'c' gibi oluyor.

# Commands

- terraform state list
- terraform state show {resource_name}
  - terraform state show aws_eip.one
  - terraform state show aws_instance.web_instance

# Resources and relations

```mermaid
  graph TD;
      subgraph .
        VPC(((aws_vpc)));

        SG --> VPC;
        SUB --> VPC;
        RT --> GW;
        RT --> VPC;
        GW --> VPC

        RT{{aws_route_table}};
        GW{{aws_internet_gateway}};
        SUB{{aws_subnet}};
        SG{{aws_security_group}};

        NIC([aws_network_interface]);

      end

      RTA([aws_route_table_association])
      EIP([aws_eip `elastic ip`])
      AI((aws_instance))

      RTA --> SUB;
      RTA --> RT;
      NIC --> SG
      NIC --> SUB
      EIP --> NIC
      EIP -- depends_on --> GW
      AI --> NIC

```
