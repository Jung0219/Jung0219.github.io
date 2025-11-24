---
title: "Multi-Resolution Two-Stage Framework for Early Wildfire Detection"
collection: projects
permalink: /projects/wildfire-detection/
image: "../images/Wildfire_Detection/detection11.png"
excerpt: "Multi-resolution, two-stage detection pipeline that boosts recall for small wildfire smoke and fire signals while filtering false positives."
layout: single
date: 2025-01-01
---

## Research Project
**June, 2025 – Present — HPC Lab, Saint Louis University**  
Advisor: *Tae-Hyuk Ahn, Ph.D.*

<div style="display: flex; gap: 16px; flex-wrap: nowrap; align-items: flex-start; margin: 12px 0 24px; justify-content: center;">
  <img src="/images/Wildfire_Detection/detection11.png" alt="Detection example 1" style="max-width: 48%; height: auto;" />
  <img src="/images/Wildfire_Detection/detection2.png" alt="Detection example 2" style="max-width: 48%; height: auto;" />
</div>

### **Overview**

- This project addresses the challenges of small-object detection in adverse or low-resolution conditions, such as wildfire smoke and UAV imagery.
- It introduces a multi-resolution, two-stage detection framework that constructs a composite image by concatenating a cropped version of the original input, enhancing object visibility across scales. The object detection model processes this composite image to identify fire and smoke, and its outputs are further verified by an image classification model to reduce false positives.

### Results

- The approach improves recall and mean Average Precision (mAP) without significantly increasing inference time. A manuscript detailing this work is currently in preparation, with me as the first author.

### Project Diagram

- Overall Architecture

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/Wildfire_Detection/diagram1.png" alt="Overall Architecture" style="max-width: 100%; border-radius: 12px;" />
</div>

- Sky Detection Framework for Cropped Images

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/Wildfire_Detection/diagram2.png" alt="Sky Detection Framework" style="max-width: 100%; border-radius: 12px;" />
</div>

### Skills Gained

- Object detection, model optimization, data preprocessing, data analysis, performance evaluation (recall, mAP), false-positive reduction, model integration, experimental design, result interpretation, research writing, literature review

### Technical Stack

- Python · PyTorch · OpenCV · Ultralytics · COCO evaluation · NumPy · Matplotlib

### Github

https://github.com/Jung0219/Wildfire-Detection
