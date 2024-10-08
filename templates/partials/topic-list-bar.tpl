<div class="{{{ if config.theme.stickyToolbar }}}sticky-tools{{{ end }}} mb-3">
	<nav class="topic-list-header d-flex flex-nowrap my-2 p-0 border-0 rounded">
		<div class="d-flex flex-row p-2 text-bg-light gap-1 border rounded w-100 align-items-center">
			<div component="category/controls" class="d-flex me-auto mb-0 gap-2 flex-wrap">
				{{{ if template.category }}}
				<!-- IMPORT partials/category/watch.tpl -->
				<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
				<!-- IMPORT partials/category/sort.tpl -->
				{{{ end }}}
				{{{ if (template.popular || template.top)}}}
				<!-- IMPORT partials/topic-terms.tpl -->
				{{{ end }}}
				{{{ if (template.unread || (template.recent || (template.popular || template.top))) }}}
				<!-- IMPORT partials/topic-filters.tpl -->
				<!-- IMPORT partials/category/filter-dropdown-left.tpl -->
				<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
				{{{ end }}}
				{{{ if template.unread }}}
				<div class="markread btn-group {{{ if !topics.length }}}hidden{{{ end }}}">
					<!-- IMPORT partials/category/selector-dropdown-left.tpl -->
				</div>
				{{{ end }}}
				{{{ if template.tag }}}
				<!-- IMPORT partials/category/filter-dropdown-left.tpl -->
				<!-- IMPORT partials/tags/watch.tpl -->
				{{{ end }}}
				<!-- IMPORT partials/category/tools.tpl -->

				{{{ if (!feeds:disableRSS && rssFeedUrl) }}}
				<a class="btn-ghost-sm d-none d-lg-flex align-self-stretch" target="_blank" href="{rssFeedUrl}" itemprop="item" title="[[global:rss-feed]]"><i class="fa fa-rss text-primary"></i></a>
				{{{ end }}}

				<a component="search/button" id="search-button" href="#" role="button" class="nav-link d-flex gap-2 align-items-center text-truncate" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="[[global:search]]">
					<span>
						<i class="fa fa-search fa-fw"></i>
					</span>
					<span class="nav-text small visible-open fw-semibold">[[global:search]]</span>
				</a>
				<div class="search-dropdown dropdown-menu p-2 shadow" role="menu">
					<form component="search/form" id="search-form" class="d-flex justify-content-end align-items-center" role="search" method="GET">
						<div component="search/fields" class="w-100" id="search-fields">
							<div class="d-flex gap-1">
								<input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="" aria-label="[[search:type-to-search]]">

								<a class="btn-ghost advanced-search-link" href="{config.relative_path}/search" title="[[search:advanced-search]]">
									<i class="fa fa-gears fa-fw text-muted"></i>
								</a>
							</div>

							<div id="quick-search-container" class="quick-search-container d-block mt-2 hidden">
								<div class="form-check filter-category mb-2 ms-2">
									<input class="form-check-input" type="checkbox" checked>
									<label class="form-check-label name text-sm"></label>
								</div>

								<div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
								<div class="quick-search-results-container"></div>
							</div>
							<button type="submit" class="btn btn-outline-secondary hide">[[global:search]]</button>
						</div>
					</form>
				</div>

				<a href="{{{ if template.category }}}{url}{{{ else }}}{config.relative_path}/{selectedFilter.url}{querystring}{{{ end }}}" class="btn btn-secondary fw-semibold position-absolute top-100 translate-middle-x start-50 mt-1 hide" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" id="new-topics-alert">
					<i class="fa fa-fw fa-arrow-up"></i> [[recent:load-new-posts]]
				</a>
			</div>

			<div class="d-flex gap-1 align-items-center">
				{{{ if template.category }}}
					{{{ if privileges.topics:create }}}
					<a href="{config.relative_path}/compose?cid={cid}" component="category/post" id="new_topic" class="btn btn-primary btn-sm text-nowrap" data-ajaxify="false" role="button">[[category:new-topic-button]]</a>
					{{{ end }}}
				{{{ else }}}
					{{{ if canPost }}}
					<!-- IMPORT partials/buttons/newTopic.tpl -->
					{{{ end }}}
				{{{ end }}}
				<!-- only show login button if not logged in and doesn't have any posting privilege -->
				{{{ if (!loggedIn && (!privileges.topics:create && !canPost))}}}
				<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-sm btn-primary">[[category:guest-login-post]]</a>
				{{{ end }}}
			</div>
		</div>
	</nav>
</div>