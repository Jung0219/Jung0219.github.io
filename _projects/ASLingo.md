---
title: "ASLingo"
collection: projects
permalink: /projects/aslingo/
image: "../images/ASLingo/hand.png"
excerpt: "Interactive ASL learning app with real-time sign recognition using ResNet18 trained on 90,000+ labeled images."
layout: single
---

<section class="project-item">
  <h2>Hask SLU (Spring 2025)</h2>

  <div class="img-with-caption" style="text-align: center; margin: 20px 0">
    <img
      src="/images/ASLingo/ASLingo_demo.gif"
      alt="ASLingo demo animation"
      style="width: 640px; border-radius: 12px; max-width: 100%"
    />
    <p class="caption" style="font-style: italic; font-size: 0.9em">
      Demonstration of ASLingo in action - real-time sign recognition feedback.
    </p>
  </div>

  <ul class="project-features">
    <li>
      Designed an interactive American Sign Language (ASL) learning application
      inspired by Duolingo's game-based format.
    </li>
    <li>
      Trained a <strong>ResNet18</strong> model on
      <strong>90,000+ labeled ASL images</strong> for accurate real-time
      hand-sign classification.
    </li>
    <li>
      Built a <strong>local API server</strong> integrated with
      <strong>OpenCV</strong> to capture live user gestures and deliver
      immediate feedback for adaptive learning.
    </li>
  </ul>

  <p>
    This project involved designing an interactive, game-style application for
    learning American Sign Language (ASL). The ResNet18 model (trained on a
    large labeled dataset) was connected to a local API server that interfaces
    with a desktop application using OpenCV for real-time image capture. As
    users performed gestures in front of the camera, the captured images were
    processed by the classifier and its predictions were used to provide
    immediate, adaptive feedback to the learner.
  </p>

  <h3>System Architecture</h3>

  <div class="img-with-caption" style="text-align: center; margin: 20px 0">
    <img
      src="/images/ASLingo/ASLingo_diagram.png"
      alt="ASLingo System Architecture Diagram"
      style="width: 100%; max-width: 800px; border-radius: 12px"
    />
    <p class="caption" style="font-style: italic; font-size: 0.9em">
      System pipeline showing model training, API communication, and user
      feedback loop.
    </p>
  </div>
</section>
