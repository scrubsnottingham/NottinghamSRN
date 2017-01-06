---
title: Sponsors and Alliances
---

<div class="row small-up-1 medium-up-2 large-up-3 align-middle align-justify sponsors" data-equalizer data-equalize-by-row="true">
	{% for item in site.data.sponsors %}
		<div class="column" data-equalizer-watch>
			<img src="{{site.base_url}}/assets/img/{{item.image}}" alt="{{item.name}}" />
		</div>
	{% endfor %}
</div>

