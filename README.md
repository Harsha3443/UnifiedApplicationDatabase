# UnifiedApplicationDatabase

# Unified Application Database (UAD)

A modular and normalized SQL Server database designed to support **multiple application domains** using a single schema.  
The database currently supports **research experiments** and **route optimization (IntelliRoute)** use cases.

---

## 📌 Overview

This project demonstrates practical SQL skills including:
- Database design and normalization
- Primary and Foreign Key relationships
- Modular schema architecture
- Analytical SQL queries using JOIN, GROUP BY, and aggregations
- Schema versioning using GitHub

The database was designed and implemented using **SQL Server (SSMS)** and exported as SQL scripts for portability.

---

## 🧩 Modules

### 1️⃣ Core Module
Handles user and project management.

**Tables**
- `User`
- `Project`

**Purpose**
- One user can own multiple projects
- Acts as the foundation for all other modules

---

### 2️⃣ Research Module
Supports machine learning and research experiments.

**Tables**
- `Dataset`
- `Experiment`
- `Metric`

**Purpose**
- Track datasets used in experiments
- Store experiment metadata (model, algorithm)
- Record performance metrics (accuracy, loss, etc.)

---

### 3️⃣ IntelliRoute Module
Supports route planning and cost analysis.

**Tables**
- `Vehicle`
- `Route`
- `RouteCost`

**Purpose**
- Store vehicle details
- Track routes between locations
- Analyze costs such as fuel, tolls, and food

---

## 🗄️ Database Schema

The complete database schema (tables, primary keys, foreign keys, and constraints) is available in:

