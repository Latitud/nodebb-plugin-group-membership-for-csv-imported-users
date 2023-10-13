<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 col-md-8 px-0 mb-4" tabindex="0">
				<div class="mb-4">
					<h5 class="fw-bold tracking-tight settings-header">Instructions</h5>

					<p>
						This plugin extends the functionalities of <a href="https://github.com/NodeBB/nodebb-plugin-import-users-csv">import-users-csv</a>.
					</p>
				</div>

				<div class="mb-4">
					<h5 class="fw-bold tracking-tight settings-header">Adding users to groups</h5>

					<p>
						To add users to groups:
					</p>
					
					<ul>
						<li>Add a "groups_to_import" column to you .csv file</li>
						<li>Add "groups_to_import" to the "Additional Fields" list</li>
					</ul>

					<p>
						The expected format of the "groups_to_import" column is:
					</p>

					<p class="alert alert-warning" id="group_to_import_format">
						Name of group 1,Name of group 2,Name of group 3
					</p>

					<p class="form-text">
						If you enter the name of a group that don't exists, a new hidden group will be created with that name.
					</p>
				</div>
		</div>
		<!-- IMPORT admin/partials/settings/toc.tpl -->
	</div>
</div>
