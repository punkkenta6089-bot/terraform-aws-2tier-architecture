# 📘 Terraform AWS 2層構成ポートフォリオ（Auto Scaling対応）

## 📌 概要
Terraformを使用して、AWS上に実務を意識した2層構成のインフラを構築しました。

本ポートフォリオでは、EC2をPrivate Subnetに配置し、ALB経由でのみアクセス可能とし、
さらにAuto Scalingを導入することで可用性とスケーラビリティを向上させています。  
Terraformによるインフラ管理（IaC）の理解を目的としています。

- VPC
- Public Subnet
- Private Subnet（2AZ）
- Internet Gateway
- NAT Gateway
- Route Table
- Security Group
- ALB（Application Load Balancer）
- Auto Scaling Group
- EC2（自動生成）

---

## 🏗️ 構成

Internet  
↓  
ALB（Application Load Balancer）  
↓  
Auto Scaling Group  
↓  
EC2（Private Subnet）  
↓  
NAT Gateway（外向き通信）  

---

## 🧠 設計意図

外部公開はALBのみに限定し、EC2はPrivate Subnetに配置することで、  
セキュリティと可用性を意識した構成としました。

また、Auto Scalingを導入することで、負荷に応じたスケールを実現しています。

---

## 🚀 実施内容

- TerraformでAWS環境を構築
- Public / Private Subnet構成を実装
- NAT Gatewayによる外向き通信の実現
- ALBを用いた負荷分散構成の実装
- Auto ScalingによるEC2の自動スケーリング
- Security Groupによる通信制御
- terraform plan による差分確認
- terraform apply によるリソース作成
- terraform destroy による環境削除まで実施

---

## ⚠️ 苦労した点

### 1. セキュリティグループの設定ミス

発生したエラー  
Self-referential block  

原因  
Security Group内で自身を参照してしまった  

対応  
ALB用とEC2用で役割を分離し、EC2はALBからの通信のみ許可するよう修正  

---

### 2. Terraformコマンドが動かなかった

発生したエラー  
terraform は認識されていません  

原因  
terraform.exe があるフォルダ以外で実行していた  

対応  
実行ディレクトリを見直し、terraform.exe があるフォルダで実行して解決  

---

### 3. Auto Scaling移行時のエラー

発生したエラー  
Reference to undeclared resource  

原因  
aws_instance を削除後、outputs.tf に参照が残っていた  

対応  
不要なoutputを削除して解決  

---

## 📚 学んだこと

- TerraformはコードでAWSリソースを管理できる
- Public / Private Subnetの役割の違い
- NAT Gatewayは外向き通信に必要
- ALBにより安全に公開できる
- Auto Scalingにより可用性とスケーラビリティを確保できる
- Security Group設計の重要性

---

## 🎯 今後の課題

- RDS（データベース）の追加
- HTTPS化（ACM + ALB）
- Route53による独自ドメイン対応
- CloudFrontによるCDN構成

---

## 🛠️ 使用技術

- Terraform
- AWS
  - VPC
  - Subnet（Public / Private）
  - Internet Gateway
  - NAT Gateway
  - Route Table
  - Security Group
  - EC2
  - ALB
  - Auto Scaling

---

## 🌐 Webサーバー動作確認

ALBのDNSにアクセスすることで、Auto Scalingによって起動したEC2に接続されます。

Hello Terraform!! Auto Scaling

Terraformの user_data を使用し、EC2起動時にWebサーバーのインストール・起動・HTML配置まで自動化しています。

※現在は停止しています

---

## 📷 動作確認

![動作確認](./images/result.png)

## 📷 Auto Scaling

![AutoScaling](./images/asg.png)

## 📷 RDS

![RDS](./images/rds.png)
---

## 🙌 補足

AWS学習の一環として作成したポートフォリオです。  
実務レベルの構成を意識しながら、継続的に改善しています。
