Absolutely. Create a file named **`README.md`** in:

```text
C:\Downloads\Projects\AI Scam\scamradar
```

Use the following professional README. It is written to fit your current project and emphasizes **n8n automation, OCR, local LLM, confidence scoring, and PostgreSQL**.

````markdown
# AI-Powered Scam Detection & Automated Risk Analysis with n8n

An automated AI-based scam detection system that analyzes screenshots of suspicious messages, extracts text using OCR, identifies scam indicators using a locally hosted LLM, generates a risk level and confidence score, and stores the analysis for further monitoring.

---

## 🚀 Overview

This project automates the process of detecting potentially fraudulent or phishing messages from screenshots.

Instead of manually reading suspicious messages, the system:

1. Receives a screenshot through an n8n Webhook.
2. Extracts text from the screenshot using OCR.
3. Sends the extracted text to a local LLM.
4. Classifies the message based on scam indicators.
5. Generates a risk level and confidence score.
6. Produces an explanation and safety recommendations.
7. Stores the analysis in PostgreSQL.

---

## ✨ Features

- 📷 Screenshot-based scam detection
- 🔍 OCR-based text extraction
- 🤖 Local LLM-powered scam analysis
- 🛡️ Risk classification
- 📊 Confidence score generation
- 🔎 Scam type identification
- 📝 AI-generated explanation
- ⚠️ Safety recommendations
- 🔄 End-to-end n8n workflow automation
- 🗄️ PostgreSQL result storage
- 🐳 Docker-based n8n and PostgreSQL deployment
- 🔐 Local AI processing using Ollama

---

## 🏗️ System Architecture

```text
                    Screenshot
                        │
                        ▼
                 ┌─────────────┐
                 │   n8n       │
                 │  Webhook    │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │ OCR.space   │
                 │ OCR Engine  │
                 └──────┬──────┘
                        │
                        ▼
                 Extracted Text
                        │
                        ▼
                ┌────────────────┐
                │ Basic LLM Chain│
                └───────┬────────┘
                        │
                        ▼
                 ┌─────────────┐
                 │ Ollama LLM  │
                 │ Llama 3.2   │
                 └──────┬──────┘
                        │
                        ▼
              Scam Analysis Result
                        │
                        ▼
                 ┌─────────────┐
                 │ Code Node   │
                 │ JSON Parser │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │ PostgreSQL  │
                 └─────────────┘
````

---

## 🧠 Scam Analysis

The AI analyzes OCR text for indicators such as:

* Phishing
* Fake login pages
* Credential theft
* Suspicious links
* Impersonation
* Urgent requests
* Payment requests
* OTP requests
* Account verification scams
* Fake job offers
* Other suspicious behavior

The system generates:

```text
Risk Level
Scam Type
Confidence Score
Explanation
Safety Recommendations
```

---

## 📊 Example Output

```json
{
  "risk_level": "High",
  "scam_type": "Phishing",
  "confidence_score": 92,
  "explanation": "The message requests account verification and sign-in information through suspicious content.",
  "safety_recommendations": "Do not provide credentials or click suspicious links."
}
```

---

## 🛠️ Technology Stack

| Technology   | Purpose                          |
| ------------ | -------------------------------- |
| n8n          | Workflow automation              |
| Docker       | Containerized services           |
| Ollama       | Local LLM runtime                |
| Llama 3.2:1B | Scam analysis                    |
| OCR.space    | Screenshot text extraction       |
| PostgreSQL   | Storing scam reports             |
| JavaScript   | Data processing and JSON parsing |
| PowerShell   | Local environment management     |

---

## 🔄 n8n Workflow

The main automation workflow is:

```text
Webhook
   ↓
HTTP Request - OCR
   ↓
Basic LLM Chain
   ↓
Code in JavaScript
   ↓
PostgreSQL
```

The LLM is connected to the Basic LLM Chain through Ollama.

---

## 🗄️ Database

The PostgreSQL database contains a `scam_reports` table with fields such as:

```text
id
risk_level
scam_type
confidence_score
explanation
safety_recommendations
ocr_text
created_at
```

This allows previous scam analyses to be stored and reviewed.

---

## ⚙️ Local Setup

### Prerequisites

Install:

* Docker Desktop
* Ollama
* Git
* n8n (through Docker Compose)

---

## 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/n8n-ai-scam-detection.git
cd n8n-ai-scam-detection
```

---

## 2. Configure environment variables

Create a `.env` file:

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=scamradar
```

> Never commit the real `.env` file to GitHub.

Use `.env.example` as a template.

---

## 3. Start Docker services

```bash
docker compose up -d
```

Check running containers:

```bash
docker ps
```

Expected services:

```text
n8n
postgres
```

Ollama runs locally on Windows and is accessed by n8n through:

```text
http://host.docker.internal:11434
```

---

## 4. Verify Ollama

Check available models:

```bash
ollama list
```

The project currently uses:

```text
llama3.2:1b
```

---

## 5. Open n8n

Open:

```text
http://localhost:5678
```

Import or configure the Scam Detection workflow.

---

## 🔐 Security Notes

* Never commit `.env` files.
* Never commit passwords or API keys.
* Do not upload local PostgreSQL database files.
* Do not upload Ollama model files.
* Keep n8n local credential data out of the repository.
* Replace test OCR credentials with your own API key before production use.

---

## 📁 Project Structure

```text
n8n-ai-scam-detection/
│
├── docker-compose.yml
├── .env.example
├── .gitignore
├── README.md
│
├── workflow/
│   └── scam-detection-workflow.json
│
├── sql/
│   └── schema.sql
│
└── screenshots/
    └── architecture.png
```

---

## 🎯 Future Improvements

Planned enhancements include:

* Automatic high-risk alerts
* Confidence-based decision rules
* Duplicate scam detection
* Rule-based pre-checks before LLM analysis
* Automated daily scam reports
* Feedback collection for incorrect predictions
* Advanced monitoring and analytics

---

## 📌 Project Objective

The objective of this project is to demonstrate how AI, OCR, workflow automation, local LLMs, and databases can be combined to build an automated security-focused application for identifying potentially fraudulent messages.

---

## 👩‍💻 Author

**Tumukunta Srivalli**

B.Tech – Computer Science & Engineering (Data Science)

---

## ⭐ Project Highlights

* Automated end-to-end AI workflow
* Screenshot-to-analysis pipeline
* Local LLM integration using Ollama
* Structured scam classification
* Confidence-based AI output
* Persistent PostgreSQL storage
* Dockerized infrastructure
* n8n workflow automation

````


