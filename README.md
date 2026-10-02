````markdown
# AI-Powered Scam Detection & Risk Analysis with n8n

An automated AI-based scam detection workflow that analyzes screenshots of suspicious messages, extracts text using OCR, evaluates scam indicators using a locally hosted LLM, generates a risk level and confidence score, and prepares structured results for database storage.

---

## Overview

This project uses **n8n workflow automation** to analyze suspicious messages received as screenshots.

The current workflow:

1. Receives a screenshot through an n8n Webhook.
2. Extracts text from the screenshot using OCR.
3. Sends the extracted text to a locally hosted LLM through Ollama.
4. Classifies the message based on scam indicators.
5. Generates a risk level, scam type, and confidence score.
6. Produces an explanation and safety recommendations.
7. Converts the AI response into structured JSON.
8. Prepares the result for PostgreSQL storage.

---

## Current Features

- Screenshot-based scam detection
- OCR text extraction
- AI-based scam classification
- Risk-level detection
- Scam-type identification
- Confidence score from 0–100
- AI-generated explanation
- Safety recommendations
- n8n end-to-end workflow automation
- Local LLM execution using Ollama
- JavaScript-based response processing
- PostgreSQL schema and database integration setup

---

## System Architecture

```text
                    Screenshot
                        │
                        ▼
                 ┌─────────────┐
                 │ n8n Webhook │
                 └──────┬──────┘
                        │
                        ▼
                 ┌─────────────┐
                 │  OCR.space  │
                 │ OCR Engine  │
                 └──────┬──────┘
                        │
                        ▼
                  Extracted Text
                        │
                        ▼
                ┌─────────────────┐
                │  Basic LLM Chain│
                └────────┬────────┘
                         │
                         ▼
                  ┌─────────────┐
                  │   Ollama    │
                  │ Llama 3.2:1B│
                  └──────┬──────┘
                         │
                         ▼
                  Scam Analysis
                         │
                         ▼
                ┌─────────────────┐
                │ JavaScript Code │
                │ Structured Data │
                └────────┬────────┘
                         │
                         ▼
                  PostgreSQL Setup
````

---

## AI Analysis

The workflow analyzes OCR text for suspicious indicators such as:

* Phishing
* Fake login requests
* Credential theft
* Suspicious links
* Impersonation
* Urgent requests
* Payment requests
* OTP requests
* Account verification scams
* Fake job offers
* Other suspicious behavior

The AI generates:

```text
Risk Level
Scam Type
Confidence Score
Explanation
Safety Recommendations
```

---

## Example Output

```json
{
  "risk_level": "High",
  "scam_type": "Phishing",
  "confidence_score": 92,
  "explanation": "The message requests account verification and login information through suspicious content.",
  "safety_recommendations": "Do not provide credentials or click suspicious links."
}
```

---

## Technology Stack

| Technology   | Purpose                          |
| ------------ | -------------------------------- |
| n8n          | Workflow automation              |
| Docker       | Containerized n8n and PostgreSQL |
| Ollama       | Local LLM runtime                |
| Llama 3.2:1B | Scam analysis                    |
| OCR.space    | Screenshot text extraction       |
| PostgreSQL   | Database storage setup           |
| JavaScript   | AI response processing           |
| PowerShell   | Local environment management     |

---

## n8n Workflow

The current workflow is:

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

The local LLM is connected to the Basic LLM Chain through Ollama.

The Ollama configuration currently uses **Llama 3.2:1B** with thinking disabled to reduce unnecessary generation time. 

---

## Confidence Score

The AI generates a confidence score between **0 and 100**.

Example:

```text
Risk Level: High
Scam Type: Phishing
Confidence Score: 92
```

The confidence score is processed by the JavaScript node together with the other AI results. 

---

## PostgreSQL Database

The project includes a `scam_reports` table designed to store:

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

The database schema is included in:

```text
sql/schema.sql
```

The PostgreSQL insertion workflow is configured, while database persistence is still being finalized and tested.

---

## Local Setup

### Prerequisites

Install:

* Docker Desktop
* Ollama
* Git

---

## 1. Clone the Repository

```bash
git clone https://github.com/TumukuntaSrivalli/scamradar-n8n-ai-automation.git
cd scamradar-n8n-ai-automation
```

---

## 2. Configure Environment Variables

Create a `.env` file:

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=scamradar
```

Never commit the real `.env` file to GitHub.

Use `.env.example` as a template.

---

## 3. Start Docker Services

```bash
docker compose up -d
```

Check the running containers:

```bash
docker ps
```

The current setup uses:

```text
n8n
postgres
```

Ollama runs separately on the Windows host.

n8n accesses the local Ollama service through:

```text
http://host.docker.internal:11434
```

---

## 4. Verify Ollama

Check the installed model:

```bash
ollama list
```

The current project uses:

```text
llama3.2:1b
```

---

## 5. Open n8n

Open:

```text
http://localhost:5678
```

Import the workflow from:

```text
workflow/scam-detection-workflow.json
```

Configure your own OCR and database credentials before running the workflow.

---

## Security

* Never commit `.env` files.
* Never commit passwords, tokens, or private API keys.
* Do not upload `n8n_data/`.
* Do not upload `postgres_data/`.
* Do not upload Ollama model files.
* Use your own OCR API credentials locally.
* Replace any test API credential in the exported workflow before publishing it publicly.

---

## Project Structure

```text
scamradar-n8n-ai-automation/
│
├── README.md
├── docker-compose.yml
├── .env.example
├── .gitignore
│
├── workflow/
│   └── scam-detection-workflow.json
│
└── sql/
    └── schema.sql
```

---

## Current Project Status

### Completed

* Screenshot upload through n8n Webhook
* OCR text extraction
* Local Ollama integration
* Llama 3.2:1B scam analysis
* Risk-level classification
* Scam-type classification
* Confidence-score generation
* Explanation generation
* Safety recommendations
* JavaScript response processing
* Dockerized n8n and PostgreSQL setup
* PostgreSQL schema creation

---

## Objective

The objective of this project is to demonstrate how **AI, OCR, local LLMs, workflow automation, JavaScript processing, Docker, and PostgreSQL** can be combined to create an automated security-focused scam detection system.

---

## Author

**Tumukunta Srivalli**

B.Tech – Computer Science and Engineering (Data Science)

---

## Highlights

* End-to-end n8n automation
* Screenshot-to-analysis pipeline
* Local AI processing with Ollama
* AI-generated confidence score
* Structured scam classification
* Docker-based infrastructure
* PostgreSQL integration


