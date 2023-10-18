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

				<div class="mb-4">
					<h5 class="fw-bold tracking-tight settings-header">Updating users profile pictures</h5>

					<p>
						To update profile pictures when creating users:
					</p>
					
					<ul>
						<li>Add a "profile_picture_url" column to you .csv file</li>
						<li>Add "profile_picture_url" to the "Additional Fields" list</li>
					</ul>

					<p>
						The "profile_picture_url" expects a URL to an .png, .jpeg or .jpg image.
					</p>

					<p class="alert alert-warning" id="group_to_import_format">
						The image will not be cropped. Try to use square images.
					</p>

				</div>

				<div class="mb-4">
					<h5 class="fw-bold tracking-tight settings-header">Updating users profile fields</h5>

					<p>
						To update a user profile field:
					</p>
					
					<ul>
						<li>Add the field name as a column to you .csv file</li>
						<li>Add the field name to the "Additional Fields" list</li>
					</ul>

					<p>
						The following field names expect a string of max. length 255:
					</p>

					<ul>
						<li>fullname</li>
						<li>website</li>
						<li>location</li>
					</ul>

					<p>
						The following field names expect a string with configurable max. lengh:
					</p>

					<ul>
						<li>aboutme</li>
						<li>signature</li>
					</ul>

					<p>
						The birthday field expect YYYY-MM-DD format string.
					</p>

					<p class="alert alert-warning" id="unintended_warning">
						This functionality is an unintended feature of the original plugin. In case of any unexpected behavior, consult the original documentation.
					</p>
				</div>

				<div class="mb-4">
					<h5 class="fw-bold tracking-tight settings-header">Adding all group tags to user profile</h5>

					<p>
						To add all group tags to the user profile, enable "Allow Multiple Badges" in /admin/settings/group before uploading the .CSV.
					</p>

					<p class="form-text">
						Be aware that the group tags will only be visible if the group configuration allows it.
					</p>

					<p class="alert alert-warning" id="unintended_warning">
						This functionality is an unintended feature of the original plugin. In case of any unexpected behavior, consult the original documentation.
					</p>
				</div>
		</div>
		<!-- IMPORT admin/partials/settings/toc.tpl -->
	</div>
</div>
