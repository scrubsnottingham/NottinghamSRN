---
title: Individual Research Projects
layout: page
---

These are projects given to us by individual consultants/departments from various hospitals. They will usually have one or two students for each project (although this can vary, please see individual project details).

<section>
	{% assign specialisms = site.projects | where_exp: "item", "item.path contains 'individual'" | group_by: "specialism" %}
	{% for specialism in specialisms %}
		<h2 id="{{specialism.name|default:"Other"|slugify}}">{{specialism.name|default:"Other"}}</h2>
		<div class="row small-up-1 medium-up-2 large-up-3" data-equalizer data-equalize-on="medium">
			{% for item in specialism.items %}
				<div class="column">
					<a href="{{item.url}}">
						<div class="card">
							<div class="card-divider">
							    <h3>{{item.title}}</h3>
							</div>
							{% if item.header_img %}
								<img src="{{item.header_img}}" />
							{% endif %}
							<div class="card-section" data-equalizer-watch>
								<dl>
									{% include components/project-info.html info=item %}
									<dt>Short Description</dt>
									<dd>
										{{item.content | split:"<!-- more -->" | first | markdownify | strip_html | truncatewords: 50 }}
									</dd>
								</dl>
							</div>
						</div>
					</a>
				</div>
			{% endfor %}
		</div>
	{% endfor %}
</section>
