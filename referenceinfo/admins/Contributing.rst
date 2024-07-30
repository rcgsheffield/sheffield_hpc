.. _admin-contributing:

Contributing
=============

If you are working on contributing to the documentation, here is a possible checklist of tasks to complete:

* Identify the scope and purpose of the documentation. 
    * What topics will be covered?
    * What level of detail is required? 
    * Consider consulting with other contributors or users to gather feedback and ensure that the documentation meets their needs.

* Create a new branch or fork of the codebase to make your changes. 
    * Make sure to name the branch or fork appropriately to reflect the purpose of the changes
    * Naming convention is author initials (*xyz* in examples below), category, issue number (if relevant), descriptive name:
    *   +-----------------+-------------------------------+
        | Category        | Example                       |
        +=================+===============================+
        | Enhancement     | xyz-en-1752-descriptive-name  |
        +-----------------+-------------------------------+
        | Fix             | xyz-fx-1752-descriptive-name  |
        +-----------------+-------------------------------+
        | Bug             | xyz-bg-1752-descriptive-name  |
        +-----------------+-------------------------------+

* Write the documentation in a clear, concise, and consistent style. 
    * Use headings, lists, and other formatting tools to make the information easy to read and understand. 
    * Consider including screenshots or diagrams to illustrate complex concepts.
    * Follow existing conventions such as placeholder usernames or implementing tab order from the newest to oldest HPC cluster.

* Add the documentation to the appropriate location in the codebase. 
    * Make sure to use the correct file format (e.g., Markdown, reStructuredText).
    * Follow existing conventions for organising documentation.
    * Make sure to use import files to deduplicate content where possible.

* Add links to the documentation from relevant parts of the site, such as the admin dashboard or help pages. 
    * Make sure that the links are clear and easy to find.

* Update existing pages to reference any new documentation.
    * Update any relevant index pages or tables of contents to include the new documentation.
    * Update the README or other project documentation to reflect the changes you have made.

* Test the documentation to ensure that it is accurate and up-to-date. 
    * Try following the instructions yourself to see if they are clear and complete. 
    * Ask other contributors or users to review the documentation and provide feedback.
    * Build the documentation on your local machine to check it does so correctly.

* Create a pull request on GitHub.
    * Make sure to describe the changes you have made in the PR description. 
    * Be sure to reference any issues or discussion threads that are related to the changes.
    * Mark a PR as draft until it is ready for review.
    * Choose appropriate reviewers for the changes you have made.
    * Monitor the PR for feedback and address any issues or concerns raised by other contributors.
    * Once the changes have been reviewed and approved, merge the PR into the main codebase.