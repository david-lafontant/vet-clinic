CREATE TABLE "patients"(
    "id" INT GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE "medical_histories"(
    "id" INT GENERATED ALWAYS AS IDENTITY,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE "invoices"(
    "id" INT GENERATED ALWAYS AS IDENTITY,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL,
    PRIMARY KEY(id)