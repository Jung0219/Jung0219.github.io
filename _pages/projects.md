---
layout: archive
title: "Projects"
permalink: /projects/
---

<style>
.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 30px;
  margin-top: 30px;
}

.project-card {
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.2s, box-shadow 0.2s;
  background: white;
  display: flex;
  flex-direction: column;
}

.project-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.project-card-image {
  width: 100%;
  height: 200px;
  background: #f5f5f5;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.project-card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.project-card-image-placeholder {
  color: #999;
  font-size: 14px;
}

.project-card-content {
  padding: 20px;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

.project-card-title {
  margin: 0 0 10px 0;
  font-size: 1.3em;
}

.project-card-title a {
  text-decoration: none;
  color: #333;
}

.project-card-title a:hover {
  color: #0066cc;
}

.project-card-description {
  color: #666;
  font-size: 0.95em;
  line-height: 1.5;
  flex-grow: 1;
}
</style>

<div class="projects-grid">
{%- for item in site.projects reversed -%}
  <article class="project-card">
    <div class="project-card-image">
      {% if item.image %}
        <img src="{{ item.image }}" alt="{{ item.title }}">
      {% else %}
        <div class="project-card-image-placeholder">Image coming soon</div>
      {% endif %}
    </div>
    <div class="project-card-content">
      <h2 class="project-card-title">
        <a href="{{ item.url }}">{{ item.title | default: item.path }}</a>
      </h2>
      {% if item.excerpt %}
        <div class="project-card-description">{{ item.excerpt }}</div>
      {% endif %}
    </div>
  </article>
{%- endfor -%}
</div>
