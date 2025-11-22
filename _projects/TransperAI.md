# TransparAI - Computer Vision Case Study

## What it does
- Medical wound classifier that pairs computer vision diagnoses with pricing transparency so patients see treatment costs the moment an image is analyzed
- Built in 48 hours at HackWashU 2025; production-ready inference API consumed by a vanilla JS frontend
- Screenshots to add:
  - Beginning scene: `![App landing](<add-path-beginning-scene>)`
  - Live screen capture: `![Live capture](<add-path-live-capture>)`
  - Injury detection: `![Detection result](<add-path-injury-detection>)`
  - Nearby hospital mapping: `![Hospital map](<add-path-hospital-map>)`

## Data & Labels
- ~12,957 labeled wound images across 8 classes: Abrasion, Bruise, Burn, Cut, Foot Ulcer, Ingrown Nail, Laceration, Stab Wound
- Train/val/test splits generated with stratified sampling (src/data_manipulation/split.py); organized for ImageFolder and YOLO classification loaders
- Augmentation pipeline (src/data_manipulation/augment.py) applies rotation, flips, and brightness/contrast changes to combat limited clinical data and imaging variance

## Model strategy
- ResNet101 transfer learning (src/classifier/ResNet/train.py): ImageNet weights, 224x224 input, Adam (lr=1e-4), CrossEntropyLoss, batch 32, 10 epochs; custom FC layer for 8-way output with best-checkpoint saving (~163 MB)
- YOLOv8n-classification (src/classifier/YOLO/train.py): lightweight 6 MB model fine-tuned on the same splits (224 px, batch 32, 10 epochs) for real-time responsiveness
- Comparative deployment lets users choose accuracy-first (ResNet, ~2-3s CPU) or speed-first (YOLO, ~1s CPU) inference depending on device constraints

## Inference & API design
- Unified Flask service (backend/api/predict.py) hot-loads both models and exposes POST /predict?model=resnet|yolo
- Preprocessing: RGB convert, 224x224 resize, ImageNet mean/std normalization for ResNet; YOLO uses its native predict pipeline
- Responses return class label and confidence; CORS enabled for browser clients; /health and /models endpoints surface model metadata and readiness

## Results
- Two production-ready CNNs serving 8-class medical wound classification with softmax probabilities
- Validation-driven checkpointing ensures only best-performing ResNet weights are exported to output/ResNet101/resnet101_8cls.pt; YOLO weights saved to output/YOLO/train/weights/best.pt
- Latency: ~1-3 seconds end-to-end on CPU, tunable via model choice; easily GPU-accelerated via PyTorch CUDA detection

## Impact
- Bridges computer vision outputs directly to hospital pricing APIs so patients get actionable, cost-aware guidance alongside wound identification
- Demonstrates deployable medical imaging ML: reproducible training scripts, audited data pipeline, and API instrumentation suitable for scaling beyond the hackathon

## My contributions
- Engineered dual-model training stack with augmentation, stratified splits, and validation-based checkpointing
- Built the model-agnostic inference layer with runtime model selection, CORS, and health/model metadata endpoints
- Benchmarked accuracy vs. latency to give end users control over inference trade-offs within the web app

## Tech stack
- PyTorch, torchvision, Ultralytics YOLO, Pillow, albumentations/imgaug, Flask, tqdm
- Deployed via Python 3.10 environment (environment.yml) with optional CUDA acceleration
