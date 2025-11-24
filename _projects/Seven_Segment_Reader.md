---
title: "Seven Segment Number Representation Reader"
collection: projects
permalink: /projects/seven-segment-reader/
image: "../images/Seven_Segment_Reader/before.png"
excerpt: "Computer vision system to detect and recognize digits from seven-segment displays using OpenCV and Python."
layout: single
date: 2024-10-01
---

## Personal Project
**September, 2023 ~ October, 2023**

<div style="display: flex; gap: 16px; flex-wrap: nowrap; align-items: flex-start; margin: 12px 0 24px; justify-content: center;">
  <img src="/images/Seven_Segment_Reader/before.png" alt="Before processing" style="max-width: 48%; height: auto;" />
  <img src="/images/Seven_Segment_Reader/after.png" alt="After processing" style="max-width: 48%; height: auto;" />
</div>

### Overview

- I developed a computer vision system to detect and recognize digits from seven-segment displays using OpenCV in Python.
- I first used preprocessing steps including color conversion, grayscale transformation, and binary thresholding, then applied contour detection and perspective transformation to isolate and correct the display region.
- Once the display region was found, I Utilized morphological operations and contour filtering to segment individual digits, and the segments were evaluated using a rule-based recognition algorithm analyzing active segments to identify digits.

### Results

- The system successfully extracted numerical information from images containing seven-segment displays, accurately recognizing and reconstructing the displayed digits. This project enhanced my proficiency in classical computer vision workflows, particularly in designing robust preprocessing pipelines and implementing logic-based feature recognition.

### Project Diagram

<div style="text-align: center; margin: 20px 0;">
  <img src="/images/Seven_Segment_Reader/diagram.png" alt="Seven Segment Reader System Diagram" style="max-width: 100%; border-radius: 12px;" />
  <p style="font-style: italic; font-size: 0.9em;">Binary Thresholding and Processing Pipeline</p>
</div>

### Skills Gained

Python programming, classical computer vision, image preprocessing, contour detection, perspective transformation, morphological operations, rule-based feature recognition, algorithm design, data visualization, numerical analysis, OpenCV workflow design, problem-solving, and debugging.

### Technical Stack

Python · OpenCV · NumPy · Matplotlib

### Github

https://github.com/Jung0219/Seven-Segment-Representation-Number-Reader
