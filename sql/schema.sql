@"
CREATE TABLE IF NOT EXISTS public.scam_reports (
    id SERIAL PRIMARY KEY,
    risk_level VARCHAR(20) NOT NULL,
    scam_type VARCHAR(50) NOT NULL,
    confidence_score NUMERIC(5,2),
    explanation TEXT,
    safety_recommendations TEXT,
    ocr_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.scam_reports
ADD COLUMN IF NOT EXISTS confidence_score NUMERIC(5,2);
"@ | Set-Content "sql\schema.sql"