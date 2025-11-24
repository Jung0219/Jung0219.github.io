---
title: "TransparAI"
collection: projects
permalink: /projects/transperai/
image: "../images/TransperAI/landing_page.png"
excerpt: "Medical wound classifier with pricing transparency - built in 48 hours at HackWashU 2025 using ResNet101 and YOLOv8."
layout: single
date: 2024-11-01
---

## Hackathon Project
**HackWashU 2025 (48 hours)**

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/TransperAI/landing_page.png" alt="TransparAI Landing Page" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">Application landing page</p>
</div>

## What it does

- Medical wound classifier that pairs computer vision diagnoses with pricing transparency so patients see treatment costs the moment an image is analyzed
- Built in 48 hours at HackWashU 2025; production-ready inference API consumed by a vanilla JS frontend

## Architecture Diagrams

### Model Training Pipeline

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/TransperAI/training_diagram.png" alt="Training Pipeline Diagram" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">Model training pipeline</p>
</div>

### End-to-End Project Overview

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/TransperAI/overall_diagram.png" alt="System Overview Diagram" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">End-to-end system architecture</p>
</div>

## Data & Labels

- ~12,957 labeled wound images across 8 classes: Abrasion, Bruise, Burn, Cut, Foot Ulcer, Ingrown Nail, Laceration, Stab Wound
- Train/val/test splits generated with stratified sampling (src/data_manipulation/split.py); organized for ImageFolder and YOLO classification loaders
- Augmentation pipeline (src/data_manipulation/augment.py) applies rotation, flips, and brightness/contrast changes to combat limited clinical data and imaging variance

## Model Strategy

- **ResNet101 transfer learning** (src/classifier/ResNet/train.py): ImageNet weights, 224x224 input, Adam (lr=1e-4), CrossEntropyLoss, batch 32, 10 epochs; custom FC layer for 8-way output with best-checkpoint saving (~163 MB)
- **YOLOv8n-classification** (src/classifier/YOLO/train.py): lightweight 6 MB model fine-tuned on the same splits (224 px, batch 32, 10 epochs) for real-time responsiveness
- Comparative deployment lets users choose accuracy-first (ResNet, ~2-3s CPU) or speed-first (YOLO, ~1s CPU) inference depending on device constraints

## Inference & API Design

- Unified Flask service (backend/api/predict.py) hot-loads both models and exposes POST /predict?model=resnet|yolo
- Preprocessing: RGB convert, 224x224 resize, ImageNet mean/std normalization for ResNet; YOLO uses its native predict pipeline
- Responses return class label and confidence; CORS enabled for browser clients; /health and /models endpoints surface model metadata and readiness

### Live Detection Interface

<div style="display: flex; gap: 16px; flex-wrap: nowrap; align-items: flex-start; margin: 12px 0 24px; justify-content: center;">
  <img src="/images/TransperAI/live_detection.png" alt="Live Detection View" style="max-width: 48%; height: auto;" />
  <img src="/images/TransperAI/live_detection_2.png" alt="Live Detection Alternate View" style="max-width: 48%; height: auto;" />
</div>

## Results

- Two production-ready CNNs serving 8-class medical wound classification with softmax probabilities
- Validation-driven checkpointing ensures only best-performing ResNet weights are exported to output/ResNet101/resnet101_8cls.pt; YOLO weights saved to output/YOLO/train/weights/best.pt
- Latency: ~1-3 seconds end-to-end on CPU, tunable via model choice; easily GPU-accelerated via PyTorch CUDA detection

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/TransperAI/detection_result.png" alt="Injury Detection Result" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">Injury detection output with classification results</p>
</div>

## Impact

- Bridges computer vision outputs directly to hospital pricing APIs so patients get actionable, cost-aware guidance alongside wound identification
- Demonstrates deployable medical imaging ML: reproducible training scripts, audited data pipeline, and API instrumentation suitable for scaling beyond the hackathon

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/TransperAI/hospital_suggestion.png" alt="Hospital Mapping" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">Nearby hospital mapping with pricing information</p>
</div>

## My Contributions

- Engineered dual-model training stack with augmentation, stratified splits, and validation-based checkpointing
- Built the model-agnostic inference layer with runtime model selection, CORS, and health/model metadata endpoints
- Benchmarked accuracy vs. latency to give end users control over inference trade-offs within the web app

## Tech Stack

Python · PyTorch · torchvision · Ultralytics YOLO · Flask · Pillow · albumentations · imgaug · tqdm

## Deployment

Deployed via Python 3.10 environment (environment.yml) with optional CUDA acceleration
