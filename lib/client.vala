/*
 * Copyright (C) 2024 Vladimir Vaskov
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

// THIS CODE WAS GENERATED, DON'T MODIFY IT

using ApiBase;

public sealed class AltRepo.Client : Object {

    internal const string API_BASE = "https://rdb.altlinux.org/api";

    SoupWrapper soup_wrapper { get; default = new SoupWrapper (); }

    construct {

    }

    /**
     * ACL groups for source packages list in specific branch
     * 
     * @param branch name of packageset
     * @param packages_names source packages names
     * 
     * @return {@link Gee.ArrayList<AclByPackages>}
     */
    public Gee.ArrayList<AclByPackages> get_acl_by_packages (
        string branch,
        string[] packages_names,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/acl/by_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "packages_names", string.joinv (",", packages_names) },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclByPackages> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * List of ACL groups for specific branch
     * 
     * @param branch name of packageset
     * @param name ACL group name
     * 
     * @return {@link Gee.ArrayList<AclGroups>}
     */
    public Gee.ArrayList<AclGroups> get_acl_groups (
        string branch,
        string? name = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/acl/groups",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name != null ? name.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclGroups> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * List the ACL groups that the given user belongs to
     * 
     * @param branch name of packageset
     * @param nickname ACL member nickname
     * 
     * @return {@link Gee.ArrayList<AclMaintainerGroups>}
     */
    public Gee.ArrayList<AclMaintainerGroups> get_acl_maintainer_groups (
        string nickname,
        string[]? branch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/acl/maintainer_groups",
            null,
            {
                { "branch", branch != null ? string.joinv (",", branch) : null },
                { "nickname", nickname.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclMaintainerGroups> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get information from bugzilla by image edition
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_image_edition (
        string branch,
        string edition,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/bug/bugzilla_by_image_edition",
            null,
            {
                { "branch", branch.to_string () },
                { "edition", edition.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get information from bugzilla by the maintainer nickname
     * 
     * @param maintainer_nickname maintainer nickname
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_maintainer (
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/bug/bugzilla_by_maintainer",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get information from bugzilla by the source package name
     * 
     * @param package_name source or binary package name
     * @param package_type packages type [source|binary]
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_package (
        string package_name,
        string? package_type = "source",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/bug/bugzilla_by_package",
            null,
            {
                { "package_name", package_name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Find packages required to backport too
     * 
     * @param from_branch packageset name where are packages backported from
     * @param into_branch packageset name where are packages backported to
     * @param packages_names source packages names
     * @param dp_type type of dependency [source|binary|both]
     * @param archs architectures to show
     * 
     * @return {@link Gee.ArrayList<BackportHelper>}
     */
    public Gee.ArrayList<BackportHelper> get_dependencies_backport_helper (
        string from_branch,
        string into_branch,
        string[] packages_names,
        string? dp_type = "both",
        string[]? archs = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/backport_helper",
            null,
            {
                { "from_branch", from_branch.to_string () },
                { "into_branch", into_branch.to_string () },
                { "packages_names", string.joinv (",", packages_names) },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BackportHelper> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get binary package dependencies
     * 
     * @param pkghash package hash
     * 
     * @return {@link DependenciesPackageDependencies}
     */
    public DependenciesPackageDependencies get_dependencies_binary_package_dependencies_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/binary_package_dependencies/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackageDependencies) jsoner.deserialize_object (typeof (DependenciesPackageDependencies));
    }

    /**
     * Fast search for dependencies by name (case sensitive)
     *         including partial occurrence.
     * 
     * @param branch packageset name
     * @param dp_name dependency name
     * @param limit number of dependencies to get
     * 
     * @return {@link FastDependencySearch}
     */
    public FastDependencySearch get_dependencies_fast_lookup (
        string branch,
        string dp_name,
        int64? limit = 10,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/fast_lookup",
            null,
            {
                { "branch", branch.to_string () },
                { "dp_name", dp_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FastDependencySearch) jsoner.deserialize_object (typeof (FastDependencySearch));
    }

    /**
     * Get binary packages by dependency name and type
     * 
     * @param branch packageset name
     * @param dp_name dependency name
     * @param dp_type type of dependency [all|provide|require|conflict|obsolete]
     * 
     * @return {@link DependenciesPackages}
     */
    public DependenciesPackages get_dependencies_packages_by_dependency (
        string branch,
        string dp_name,
        string? dp_type = "all",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/packages_by_dependency",
            null,
            {
                { "branch", branch.to_string () },
                { "dp_name", dp_name.to_string () },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackages) jsoner.deserialize_object (typeof (DependenciesPackages));
    }

    /**
     * Get source package build dependencies
     * 
     * @param pkghash package hash
     * @param branch packageset name
     * @param depth dependency level limit
     * 
     * @return {@link DependenciesPackageBuildDependencies}
     */
    public DependenciesPackageBuildDependencies get_dependencies_source_package_dependencies_pkghash (
        string branch,
        int64 pkghash,
        int64? depth = 1,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/source_package_dependencies/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "depth", depth != null ? depth.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackageBuildDependencies) jsoner.deserialize_object (typeof (DependenciesPackageBuildDependencies));
    }

    /**
     * Get packages build dependencies by set of parameters
     * 
     * @param name source package name
     * @param branch packageset name
     * @param dp_type type of dependency [source|binary|both]
     * 
     * @return {@link PackageBuildDependency}
     */
    public PackageBuildDependency get_dependencies_what_depends_src (
        string name,
        string branch,
        string? dp_type = "both",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/dependencies/what_depends_src",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageBuildDependency) jsoner.deserialize_object (typeof (PackageBuildDependency));
    }

    /**
     * Get information about branch update erratas
     * 
     * @param payload 
     * 
     * @return {@link ErrataBranchesUpdates}
     */
    public ErrataBranchesUpdates post_errata_branches_updates (
        ErrataJsonPostList payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/errata/branches_updates",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataBranchesUpdates) jsoner.deserialize_object (typeof (ErrataBranchesUpdates));
    }

    /**
     * Get list of branches form errata history.
     * 
     * 
     * @return {@link ErrataBranches}
     */
    public ErrataBranches get_errata_errata_branches (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/errata_branches",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataBranches) jsoner.deserialize_object (typeof (ErrataBranches));
    }

    /**
     * Get branches with OVAL definitions export available
     * 
     * 
     * @return {@link OvalBranches}
     */
    public OvalBranches get_errata_export_oval_branches (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/export/oval/branches",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (OvalBranches) jsoner.deserialize_object (typeof (OvalBranches));
    }

    /**
     * Get OVAL definitions of closed issues of branch packages
     * 
     * @param branch 
     * @param package_name source or binary package name
     * @param one_file return OVAL definitions as one XML file
     * 
     * @return {@link string}
     */
    public string get_errata_export_oval_branch (
        string branch,
        string? package_name = null,
        bool? one_file = false,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/export/oval/$branch",
            null,
            {
                { "package_name", package_name != null ? package_name.to_string () : null },
                { "one_file", one_file != null ? one_file.to_string () : null },
            },
            null,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Find errata by ID, vulnerability ID or package name.
     * 
     * @param input errata search arguments
     * @param branch branch name
     * @param type errata type [packages|repository|bug|vuln]
     * @param page number page
     * @param limit number of records
     * @param state errata state
     * 
     * @return {@link ErrataLastChanged}
     */
    public ErrataLastChanged get_errata_find_erratas (
        string[]? input = null,
        string? branch = null,
        string? type = null,
        int64? page = null,
        int64? limit = null,
        string? state = "all",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/find_erratas",
            null,
            {
                { "input", input != null ? string.joinv (",", input) : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "type", type != null ? type.to_string () : null },
                { "page", page != null ? page.to_string () : null },
                { "limit", limit != null ? limit.to_string () : null },
                { "state", state != null ? state.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataLastChanged) jsoner.deserialize_object (typeof (ErrataLastChanged));
    }

    /**
     * Find errata by image UUID.
     * 
     * @param uuid Image UUID
     * @param branch branch name
     * @param component Image component
     * @param input errata search arguments
     * @param type errata type [packages|repository|bug|vuln]
     * @param page number page
     * @param limit number of records
     * @param is_discarded is errata discarded
     * @param sort sort arguments
     * 
     * @return {@link ImageErrata}
     */
    public ImageErrata get_errata_find_image_erratas (
        string uuid,
        string branch,
        string? component = null,
        string[]? input = null,
        string? type = null,
        int64? page = null,
        int64? limit = null,
        bool? is_discarded = false,
        string[]? sort = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/find_image_erratas",
            null,
            {
                { "uuid", uuid.to_string () },
                { "branch", branch.to_string () },
                { "component", component != null ? component.to_string () : null },
                { "input", input != null ? string.joinv (",", input) : null },
                { "type", type != null ? type.to_string () : null },
                { "page", page != null ? page.to_string () : null },
                { "limit", limit != null ? limit.to_string () : null },
                { "is_discarded", is_discarded != null ? is_discarded.to_string () : null },
                { "sort", sort != null ? string.joinv (",", sort) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageErrata) jsoner.deserialize_object (typeof (ImageErrata));
    }

    /**
     * Get list of valid Errata identifiers
     * 
     * 
     * @return {@link ErrataIdsList}
     */
    public ErrataIdsList get_errata_ids (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/ids",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataIdsList) jsoner.deserialize_object (typeof (ErrataIdsList));
    }

    /**
     * Get information about package update erratas
     * 
     * @param payload 
     * 
     * @return {@link ErrataPackagesUpdates}
     */
    public ErrataPackagesUpdates post_errata_packages_updates (
        ErrataJsonPostList payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/errata/packages_updates",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataPackagesUpdates) jsoner.deserialize_object (typeof (ErrataPackagesUpdates));
    }

    /**
     * Find erratas by given arguments
     * 
     * @param branch branch name
     * @param name source package name
     * @param vuln_id CVE, BDU or Bug ID
     * @param errata_id errata ID
     * 
     * @return {@link Erratas}
     */
    public Erratas get_errata_search (
        string? branch = null,
        string? name = null,
        string? vuln_id = null,
        string? errata_id = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/errata/search",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "name", name != null ? name.to_string () : null },
                { "vuln_id", vuln_id != null ? vuln_id.to_string () : null },
                { "errata_id", errata_id != null ? errata_id.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (Erratas) jsoner.deserialize_object (typeof (Erratas));
    }

    /**
     * Get branch binary packages info
     * 
     * @param branch branch name
     * @param arch package architecture
     * 
     * @return {@link PackagesetPackagesExport}
     */
    public PackagesetPackagesExport get_export_branch_binary_packages_branch (
        string branch,
        string? arch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/export/branch_binary_packages/$branch",
            null,
            {
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetPackagesExport) jsoner.deserialize_object (typeof (PackagesetPackagesExport));
    }

    /**
     * Branch tree info export
     * 
     * 
     * @return {@link BranchTree}
     */
    public BranchTree get_export_branch_tree (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/export/branch_tree",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BranchTree) jsoner.deserialize_object (typeof (BranchTree));
    }

    /**
     * Get branch info export for Repology
     * 
     * @param branch branch name
     * 
     * @return {@link RepologyExport}
     */
    public RepologyExport get_export_repology_branch (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/export/repology/$branch",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepologyExport) jsoner.deserialize_object (typeof (RepologyExport));
    }

    /**
     * Get branch source packages for sitemap
     * 
     * @param branch branch name
     * 
     * @return {@link SitemapPackagesExport}
     */
    public SitemapPackagesExport get_export_sitemap_packages_branch (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/export/sitemap_packages/$branch",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitemapPackagesExport) jsoner.deserialize_object (typeof (SitemapPackagesExport));
    }

    /**
     * Get an archive of PO files with package's summary and description for translation purpose
     * 
     * @param branches list of package sets to filter result
     * @param from_date take packages of branch states from date (YYYY-MM-DD)
     * 
     * @return {@link string}
     */
    public string get_export_translation_packages_po_files (
        string[] branches,
        string? from_date = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/export/translation/packages_po_files",
            null,
            {
                { "branches", string.joinv (",", branches) },
                { "from_date", from_date != null ? from_date.to_string () : null },
            },
            null,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Fast search files by name (case sensitive) including partial occurrence.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * @param limit number of files to get
     * 
     * @return {@link FastFileSearch}
     */
    public FastFileSearch get_file_fast_lookup (
        string branch,
        string file_name,
        int64? limit = 10,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/file/fast_lookup",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FastFileSearch) jsoner.deserialize_object (typeof (FastFileSearch));
    }

    /**
     * Get a list of packages to which the specified file belongs to.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * 
     * @return {@link FilePackagesByFile}
     */
    public FilePackagesByFile get_file_packages_by_file (
        string branch,
        string file_name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/file/packages_by_file",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FilePackagesByFile) jsoner.deserialize_object (typeof (FilePackagesByFile));
    }

    /**
     * Find files by name (case sensitive) including partial occurrence.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * @param limit number of files to get
     * 
     * @return {@link Files}
     */
    public Files get_file_search (
        string branch,
        string file_name,
        int64? limit = 1000,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/file/search",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (Files) jsoner.deserialize_object (typeof (Files));
    }

    /**
     * Get active images for a given repository
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * @param version Image version
     * @param release Image release type
     * @param variant Image variant
     * @param type Image type
     * 
     * @return {@link ActiveImages}
     */
    public ActiveImages get_image_active_images (
        string? branch = null,
        string? edition = null,
        string? version = null,
        string? release = null,
        string? variant = null,
        string? type = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/active_images",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "variant", variant != null ? variant.to_string () : null },
                { "type", type != null ? type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ActiveImages) jsoner.deserialize_object (typeof (ActiveImages));
    }

    /**
     * Get images by package name for a given repository and edition
     * 
     * @param branch name of packageset
     * @param pkg_name package name
     * @param edition Image edition
     * @param pkg_type packages type [source|binary]
     * @param img_show show images[active|all]
     * 
     * @return {@link FindImagesByPackage}
     */
    public FindImagesByPackage get_image_find_images_by_package_name (
        string pkg_name,
        string? branch = null,
        string? edition = null,
        string? pkg_type = "source",
        string? img_show = "all",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/find_images_by_package_name",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "pkg_name", pkg_name.to_string () },
                { "edition", edition != null ? edition.to_string () : null },
                { "pkg_type", pkg_type != null ? pkg_type.to_string () : null },
                { "img_show", img_show != null ? img_show.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindImagesByPackage) jsoner.deserialize_object (typeof (FindImagesByPackage));
    }

    /**
     * Get list of package categories with count for image
     * 
     * @param uuid Image UUID
     * @param component Image component
     * 
     * @return {@link SiteImageCategories}
     */
    public SiteImageCategories get_image_image_categories_count (
        string uuid,
        string? component = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_categories_count",
            null,
            {
                { "uuid", uuid.to_string () },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteImageCategories) jsoner.deserialize_object (typeof (SiteImageCategories));
    }

    /**
     * Get branch images info
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * @param version Image version
     * @param release Image release type
     * @param variant Image variant
     * @param flavor Image flavor
     * @param arch Image architecture
     * @param component Image component
     * @param platform Image platform
     * @param type Image type
     * 
     * @return {@link ImageInfo}
     */
    public ImageInfo get_image_image_info (
        string? branch = null,
        string? edition = null,
        string? version = null,
        string? release = null,
        string? variant = null,
        string? flavor = null,
        string? arch = null,
        string? component = null,
        string? platform = null,
        string? type = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_info",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "variant", variant != null ? variant.to_string () : null },
                { "flavor", flavor != null ? flavor.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
                { "component", component != null ? component.to_string () : null },
                { "platform", platform != null ? platform.to_string () : null },
                { "type", type != null ? type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageInfo) jsoner.deserialize_object (typeof (ImageInfo));
    }

    /**
     * Get list of image packages in accordance to given parameters
     * 
     * @param uuid Image UUID
     * @param group package category
     * @param component Image component
     * 
     * @return {@link ImagePackages}
     */
    public ImagePackages get_image_image_packages (
        string uuid,
        string? group = null,
        string? component = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_packages",
            null,
            {
                { "uuid", uuid.to_string () },
                { "group", group != null ? group.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackages) jsoner.deserialize_object (typeof (ImagePackages));
    }

    /**
     * Get a list of package sets which has an active images.
     * 
     * 
     * @return {@link ImagePackageSet}
     */
    public ImagePackageSet get_image_image_packageset (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_packageset",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackageSet) jsoner.deserialize_object (typeof (ImagePackageSet));
    }

    /**
     * Get image status into database
     * 
     * 
     * @return {@link ImageStatusGet}
     */
    public ImageStatusGet get_image_image_status (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_status",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageStatusGet) jsoner.deserialize_object (typeof (ImageStatusGet));
    }

    /**
     * Get iso image status into database
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * 
     * @return {@link ImageTagStatusGet}
     */
    public ImageTagStatusGet get_image_image_tag_status (
        string? branch = null,
        string? edition = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_tag_status",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageTagStatusGet) jsoner.deserialize_object (typeof (ImageTagStatusGet));
    }

    /**
     * Get image UUID by image tag
     * 
     * @param tag Image tag
     * 
     * @return {@link ImageTagUUID}
     */
    public ImageTagUUID get_image_image_uuid_by_tag (
        string tag,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/image_uuid_by_tag",
            null,
            {
                { "tag", tag.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageTagUUID) jsoner.deserialize_object (typeof (ImageTagUUID));
    }

    /**
     * Inspect binary packages from regular distribution image
     * 
     * @param payload 
     * 
     * @return {@link ImagePackagesInspectRegular}
     */
    public ImagePackagesInspectRegular post_image_inspect_regular (
        ImagePackagesJSON payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/image/inspect/regular",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackagesInspectRegular) jsoner.deserialize_object (typeof (ImagePackagesInspectRegular));
    }

    /**
     * Inspect binary packages from SP distribution image
     * 
     * @param payload 
     * 
     * @return {@link ImagePackagesInspectSP}
     */
    public ImagePackagesInspectSP post_image_inspect_sp (
        ImagePackagesJSON payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/image/inspect/sp",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackagesInspectSP) jsoner.deserialize_object (typeof (ImagePackagesInspectSP));
    }

    /**
     * Get all ISO images
     * 
     * 
     * @return {@link ImageAllISO}
     */
    public ImageAllISO get_image_iso_all_images (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/iso/all_images",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageAllISO) jsoner.deserialize_object (typeof (ImageAllISO));
    }

    /**
     * Get list of last packages from image for given parameters
     * 
     * @param branch name of packageset
     * @param uuid Image UUID
     * @param packages_limit number of last packages to get
     * @param component Image component
     * 
     * @return {@link LastImagePackages}
     */
    public LastImagePackages get_image_last_packages_by_image (
        string branch,
        string uuid,
        int64? packages_limit = null,
        string? component = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/last_packages_by_image",
            null,
            {
                { "branch", branch.to_string () },
                { "uuid", uuid.to_string () },
                { "packages_limit", packages_limit != null ? packages_limit.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LastImagePackages) jsoner.deserialize_object (typeof (LastImagePackages));
    }

    /**
     * Get information about last packages with CVE fixes mentioned in changelog for given image
     * 
     * @param branch name of packageset
     * @param uuid Image UUID
     * @param packages_limit number of last packages to get
     * @param component Image component
     * 
     * @return {@link LastImagePackages}
     */
    public LastImagePackages get_image_last_packages_image_with_cve_fixed (
        string branch,
        string uuid,
        int64? packages_limit = null,
        string? component = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/image/last_packages_image_with_cve_fixed",
            null,
            {
                { "branch", branch.to_string () },
                { "uuid", uuid.to_string () },
                { "packages_limit", packages_limit != null ? packages_limit.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LastImagePackages) jsoner.deserialize_object (typeof (LastImagePackages));
    }

    /**
     * get license
     * 
     * 
     * @return {@link string}
     */
    public string get_license (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/license",
            null,
            null,
            null,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Get license info by SPDX license ID
     * 
     * @param license SPDX license id
     * 
     * @return {@link LicenseInfo}
     */
    public LicenseInfo get_license_info (
        string license,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/license/info",
            null,
            {
                { "license", license.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LicenseInfo) jsoner.deserialize_object (typeof (LicenseInfo));
    }

    /**
     * Get valid license tokens and SPDX license IDs
     * 
     * @param license package license string
     * 
     * @return {@link LicenseTokens}
     */
    public LicenseTokens get_license_tokens (
        string license,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/license/tokens",
            null,
            {
                { "license", license.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LicenseTokens) jsoner.deserialize_object (typeof (LicenseTokens));
    }

    /**
     * Get list of packages required for build by given source packages list recursively
     * 
     * @param branch name of packageset
     * @param packages package or list of packages
     * @param arch packages architecture
     * 
     * @return {@link BuildDependencySet}
     */
    public BuildDependencySet get_package_build_dependency_set (
        string branch,
        string[] packages,
        string? arch = "x86_64",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/build_dependency_set",
            null,
            {
                { "branch", branch.to_string () },
                { "packages", string.joinv (",", packages) },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BuildDependencySet) jsoner.deserialize_object (typeof (BuildDependencySet));
    }

    /**
     * Get information about packages from package sets by given source packages list
     * 
     * @param packages package or list of packages
     * @param branches list of package sets to filter result
     * 
     * @return {@link PackageFindPackageset}
     */
    public PackageFindPackageset get_package_find_packageset (
        string[] packages,
        string[]? branches = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/find_packageset",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branches", branches != null ? string.joinv (",", branches) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageFindPackageset) jsoner.deserialize_object (typeof (PackageFindPackageset));
    }

    /**
     * Get packages with conflicting files in packages that don't have a conflict in dependencies
     * 
     * @param packages package or list of packages
     * @param branch name of packageset
     * @param archs list of packages architectures
     * 
     * @return {@link PackageMisconflictPackages}
     */
    public PackageMisconflictPackages get_package_misconflict (
        string[] packages,
        string branch,
        string[]? archs = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/misconflict",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branch", branch.to_string () },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageMisconflictPackages) jsoner.deserialize_object (typeof (PackageMisconflictPackages));
    }

    /**
     * Get information about binary packages from  last package sets by given file MD5 checksum and package set name
     * 
     * @param branch name of packageset
     * @param md5 file MD5 checksum
     * @param arch packages architecture
     * 
     * @return {@link PackageByFileName}
     */
    public PackageByFileName get_package_package_by_file_md5 (
        string branch,
        string md5,
        string? arch = "x86_64",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/package_by_file_md5",
            null,
            {
                { "branch", branch.to_string () },
                { "md5", md5.to_string () },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) jsoner.deserialize_object (typeof (PackageByFileName));
    }

    /**
     * Get information about binary packages from  last package sets by given file name and package set name.
     * File name wildcars '*' is allowed.
     * 
     * @param file file name
     * @param branch name of packageset
     * @param arch packages architecture
     * 
     * @return {@link PackageByFileName}
     */
    public PackageByFileName get_package_package_by_file_name (
        string file,
        string branch,
        string? arch = "x86_64",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/package_by_file_name",
            null,
            {
                { "file", file.to_string () },
                { "branch", branch.to_string () },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) jsoner.deserialize_object (typeof (PackageByFileName));
    }

    /**
     * Get package files by hash
     * 
     * @param pkghash 
     * 
     * @return {@link PackageFiles}
     */
    public PackageFiles get_package_package_files_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/package_files/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageFiles) jsoner.deserialize_object (typeof (PackageFiles));
    }

    /**
     * Get information for package by parameters from last packages
     * 
     * @param name package name
     * @param version package version
     * @param release package release
     * @param arch packages architecture
     * @param source is source package
     * @param branch name of packageset
     * @param disttag package disttag
     * @param sha1 package SHA1 checksum
     * @param packager package packager name
     * @param packager_email package packager email
     * @param full show full package information
     * 
     * @return {@link PackageInfo}
     */
    public PackageInfo get_package_package_info (
        string? name = null,
        string? version = null,
        string? release = null,
        string? arch = "x86_64",
        bool? source = false,
        string? branch = null,
        string? disttag = null,
        string? sha1 = null,
        string? packager = null,
        string? packager_email = null,
        bool? full = false,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/package_info",
            null,
            {
                { "name", name != null ? name.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
                { "source", source != null ? source.to_string () : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "disttag", disttag != null ? disttag.to_string () : null },
                { "sha1", sha1 != null ? sha1.to_string () : null },
                { "packager", packager != null ? packager.to_string () : null },
                { "packager_email", packager_email != null ? packager_email.to_string () : null },
                { "full", full != null ? full.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageInfo) jsoner.deserialize_object (typeof (PackageInfo));
    }

    /**
     * Get information about binary packages from  last package sets by given file names array and package set name.
     * File name wildcars '*' is not allowed.
     * 
     * @param payload 
     * 
     * @return {@link PackageByFileName}
     */
    public PackageByFileName post_package_packages_by_file_names (
        PackagesByFileNamesJson payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/package/packages_by_file_names",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) jsoner.deserialize_object (typeof (PackageByFileName));
    }

    /**
     * Get repocop data by name, version and release
     * 
     * @param branch name of packageset
     * @param package_name source or binary package name
     * @param package_version source or binary package version
     * @param package_release source or binary package release
     * @param bin_package_arch binary package arch
     * @param package_type packages type [source|binary]
     * 
     * @return {@link RepocopJsonGetList}
     */
    public RepocopJsonGetList get_package_repocop (
        string branch,
        string package_name,
        string? package_version = null,
        string? package_release = null,
        string? bin_package_arch = null,
        string? package_type = "source",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/repocop",
            null,
            {
                { "branch", branch.to_string () },
                { "package_name", package_name.to_string () },
                { "package_version", package_version != null ? package_version.to_string () : null },
                { "package_release", package_release != null ? package_release.to_string () : null },
                { "bin_package_arch", bin_package_arch != null ? bin_package_arch.to_string () : null },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepocopJsonGetList) jsoner.deserialize_object (typeof (RepocopJsonGetList));
    }

    /**
     * Get spec file by source package hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link PackageSpecfile}
     */
    public PackageSpecfile get_package_specfile_by_hash_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/specfile_by_hash/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSpecfile) jsoner.deserialize_object (typeof (PackageSpecfile));
    }

    /**
     * Get spec file by source package name and branch
     * 
     * @param branch name of packageset
     * @param name source package name
     * 
     * @return {@link PackageSpecfile}
     */
    public PackageSpecfile get_package_specfile_by_name (
        string branch,
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/specfile_by_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSpecfile) jsoner.deserialize_object (typeof (PackageSpecfile));
    }

    /**
     * Get information about unpackaged directories by maintainer nickname
     * 
     * @param branch name of packageset
     * @param packager maintainer nickname
     * @param archs list of packages architectures
     * 
     * @return {@link UnpackagedDirs}
     */
    public UnpackagedDirs get_package_unpackaged_dirs (
        string branch,
        string packager,
        string[]? archs = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/unpackaged_dirs",
            null,
            {
                { "branch", branch.to_string () },
                { "packager", packager.to_string () },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (UnpackagedDirs) jsoner.deserialize_object (typeof (UnpackagedDirs));
    }

    /**
     * Get packages build dependencies by set of parameters
     * 
     * @param packages package or list of packages
     * @param branch name of packageset
     * @param depth dependency depth
     * @param dptype dependency type [source|binary|both]
     * @param archs list of packages architectures
     * @param leaf assembly dependency chain package
     * @param finite_package topological tree leaves packages
     * @param filter_by_package filter result by dependency on binary packages
     * @param filter_by_source filter result by dependency on source package
     * @param oneandhalf use dependency depth 1.5
     * @param use_last_tasks use repo state including last done tasks
     * 
     * @return {@link PackageBuildDependency}
     */
    public PackageBuildDependency get_package_what_depends_src (
        string[] packages,
        string branch,
        int64? depth = 1,
        string? dptype = "both",
        string[]? archs = null,
        string? leaf = null,
        bool? finite_package = false,
        string[]? filter_by_package = null,
        string? filter_by_source = null,
        bool? oneandhalf = false,
        bool? use_last_tasks = false,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/package/what_depends_src",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branch", branch.to_string () },
                { "depth", depth != null ? depth.to_string () : null },
                { "dptype", dptype != null ? dptype.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "leaf", leaf != null ? leaf.to_string () : null },
                { "finite_package", finite_package != null ? finite_package.to_string () : null },
                { "filter_by_package", filter_by_package != null ? string.joinv (",", filter_by_package) : null },
                { "filter_by_source", filter_by_source != null ? filter_by_source.to_string () : null },
                { "oneandhalf", oneandhalf != null ? oneandhalf.to_string () : null },
                { "use_last_tasks", use_last_tasks != null ? use_last_tasks.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageBuildDependency) jsoner.deserialize_object (typeof (PackageBuildDependency));
    }

    /**
     * Get list of active package sets
     * 
     * 
     * @return {@link PackageSetActivePackageSets}
     */
    public PackageSetActivePackageSets get_packageset_active_packagesets (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/active_packagesets",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSetActivePackageSets) jsoner.deserialize_object (typeof (PackageSetActivePackageSets));
    }

    /**
     * Get difference list of packages from two package sets
     * 
     * @param pkgset1 first packageset name
     * @param pkgset2 second packageset name
     * 
     * @return {@link PackagesetCompare}
     */
    public PackagesetCompare get_packageset_compare_packagesets (
        string pkgset1,
        string pkgset2,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/compare_packagesets",
            null,
            {
                { "pkgset1", pkgset1.to_string () },
                { "pkgset2", pkgset2.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetCompare) jsoner.deserialize_object (typeof (PackagesetCompare));
    }

    /**
     * Get packages by packageset component and architecture.
     * 
     * @param branch name of packageset
     * @param arch architecture name
     * @param component component name
     * 
     * @return {@link PackagesByUuid}
     */
    public PackagesByUuid get_packageset_packages_by_component (
        string branch,
        string arch,
        string component,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/packages_by_component",
            null,
            {
                { "branch", branch.to_string () },
                { "arch", arch.to_string () },
                { "component", component.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesByUuid) jsoner.deserialize_object (typeof (PackagesByUuid));
    }

    /**
     * Get packages by packageset component UUID
     * 
     * @param uuid packageset component UUID
     * 
     * @return {@link PackagesByUuid}
     */
    public PackagesByUuid get_packageset_packages_by_uuid (
        string uuid,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/packages_by_uuid",
            null,
            {
                { "uuid", uuid.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesByUuid) jsoner.deserialize_object (typeof (PackagesByUuid));
    }

    /**
     * Get package set status into database
     * 
     * 
     * @return {@link PackageSetStatusGet}
     */
    public PackageSetStatusGet get_packageset_pkgset_status (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/pkgset_status",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSetStatusGet) jsoner.deserialize_object (typeof (PackageSetStatusGet));
    }

    /**
     * Get list of packageset packages. Architecture argument is actual only if type is 'binary'.
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * @param archs list of packages architectures
     * 
     * @return {@link PackagesetPackages}
     */
    public PackagesetPackages get_packageset_repository_packages (
        string branch,
        string? package_type = "all",
        string[]? archs = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/repository_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetPackages) jsoner.deserialize_object (typeof (PackagesetPackages));
    }

    /**
     * Get repository statistics
     * 
     * @param branch name of packageset
     * 
     * @return {@link RepositoryStatistics}
     */
    public RepositoryStatistics get_packageset_repository_statistics (
        string? branch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/packageset/repository_statistics",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepositoryStatistics) jsoner.deserialize_object (typeof (RepositoryStatistics));
    }

    /**
     * alias for /all_maintainers_with_nicknames
     * 
     * @param branch name of packageset
     * 
     * @return {@link Gee.ArrayList<AllMaintainers>}
     */
    public Gee.ArrayList<AllMaintainers> get_site_all_maintainers (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_maintainers",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AllMaintainers> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * List of maintainers in branch with nicknames and source packages count
     * 
     * @param branch name of packageset
     * 
     * @return {@link Gee.ArrayList<AllMaintainers>}
     */
    public Gee.ArrayList<AllMaintainers> get_site_all_maintainers_with_nicknames (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_maintainers_with_nicknames",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AllMaintainers> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get binary package archs list
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteAllArchs}
     */
    public SiteAllArchs get_site_all_pkgset_archs (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_pkgset_archs",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllArchs) jsoner.deserialize_object (typeof (SiteAllArchs));
    }

    /**
     * Get binary package archs list with source packages count
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteAllArchs}
     */
    public SiteAllArchs get_site_all_pkgset_archs_with_src_count (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_pkgset_archs_with_src_count",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllArchs) jsoner.deserialize_object (typeof (SiteAllArchs));
    }

    /**
     * Get package sets list
     * 
     * 
     * @return {@link SiteAllPackagasets}
     */
    public SiteAllPackagasets get_site_all_pkgsets (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_pkgsets",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagasets) jsoner.deserialize_object (typeof (SiteAllPackagasets));
    }

    /**
     * Get package sets list with source packages count
     * 
     * 
     * @return {@link SiteAllPackagesetsSummary}
     */
    public SiteAllPackagesetsSummary get_site_all_pkgsets_summary (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_pkgsets_summary",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagesetsSummary) jsoner.deserialize_object (typeof (SiteAllPackagesetsSummary));
    }

    /**
     * Get package sets list with source packages count
     * 
     * 
     * @return {@link SiteAllPackagasets}
     */
    public SiteAllPackagasets get_site_all_pkgsets_with_src_count (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/all_pkgsets_with_src_count",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagasets) jsoner.deserialize_object (typeof (SiteAllPackagasets));
    }

    /**
     * Get Beehive rebuild errors by the maintainer's nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<SiteBeehiveByMaintainer>}
     */
    public Gee.ArrayList<SiteBeehiveByMaintainer> get_site_beehive_errors_by_maintainer (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/beehive_errors_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteBeehiveByMaintainer> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get binary package archs and versions
     * 
     * @param branch name of packageset
     * @param name binary package name
     * 
     * @return {@link SitePackagesBinaryList}
     */
    public SitePackagesBinaryList get_site_binary_package_archs_and_versions (
        string branch,
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/binary_package_archs_and_versions",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesBinaryList) jsoner.deserialize_object (typeof (SitePackagesBinaryList));
    }

    /**
     * Get binary package scripts
     * 
     * @param pkghash 
     * 
     * @return {@link SiteBinPackageScripts}
     */
    public SiteBinPackageScripts get_site_binary_package_scripts_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/binary_package_scripts/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteBinPackageScripts) jsoner.deserialize_object (typeof (SiteBinPackageScripts));
    }

    /**
     * Get information about package deleted from branch
     * 
     * @param branch name of packageset
     * @param name package name
     * @param package_type packages type [source|binary]
     * @param arch arch of binary packages
     * 
     * @return {@link SiteDeletedPackage}
     */
    public SiteDeletedPackage get_site_deleted_package_info (
        string branch,
        string name,
        string? package_type = "source",
        string? arch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/deleted_package_info",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteDeletedPackage) jsoner.deserialize_object (typeof (SiteDeletedPackage));
    }

    /**
     * Fast packages search by name
     * 
     * @param name package or list of package names
     * @param branch name of packageset
     * 
     * @return {@link SiteFastPackagesSearch}
     */
    public SiteFastPackagesSearch get_site_fast_packages_search_lookup (
        string[] name,
        string? branch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/fast_packages_search_lookup",
            null,
            {
                { "name", string.joinv (",", name) },
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteFastPackagesSearch) jsoner.deserialize_object (typeof (SiteFastPackagesSearch));
    }

    /**
     * Find packages by name
     * 
     * @param name package or list of package names
     * @param branch name of packageset
     * @param arch binary package arch
     * 
     * @return {@link SiteFingPackages}
     */
    public SiteFingPackages get_site_find_packages (
        string[] name,
        string? branch = null,
        string? arch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/find_packages",
            null,
            {
                { "name", string.joinv (",", name) },
                { "branch", branch != null ? branch.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteFingPackages) jsoner.deserialize_object (typeof (SiteFingPackages));
    }

    /**
     * Find source package in branch by binary package name
     * 
     * @param branch name of packageset
     * @param name package name
     * 
     * @return {@link FindSourcePackageInBranch}
     */
    public FindSourcePackageInBranch get_site_find_source_package (
        string branch,
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/find_source_package",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindSourcePackageInBranch) jsoner.deserialize_object (typeof (FindSourcePackageInBranch));
    }

    /**
     * Get list of last packages from tasks for given parameters
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * @param task_owner task owner's nickname
     * 
     * @return {@link SiteLastPackages}
     */
    public SiteLastPackages get_site_last_packages (
        string branch,
        int64 tasks_limit = 10,
        string? task_owner = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/last_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "tasks_limit", tasks_limit.to_string () },
                { "task_owner", task_owner != null ? task_owner.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackages) jsoner.deserialize_object (typeof (SiteLastPackages));
    }

    /**
     * Get list of last packages from branch for given parameters
     * 
     * @param branch name of packageset
     * @param packages_limit number of last packages to get
     * @param packager package packager's nickname
     * 
     * @return {@link SiteLastBranchPackages}
     */
    public SiteLastBranchPackages get_site_last_packages_by_branch (
        string branch,
        int64 packages_limit = 10,
        string? packager = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/last_packages_by_branch",
            null,
            {
                { "branch", branch.to_string () },
                { "packages_limit", packages_limit.to_string () },
                { "packager", packager != null ? packager.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastBranchPackages) jsoner.deserialize_object (typeof (SiteLastBranchPackages));
    }

    /**
     * Get list of last packages from tasks for given parameters
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * @param task_owner task owner's nickname
     * 
     * @return {@link SiteLastPackages}
     */
    public SiteLastPackages get_site_last_packages_by_tasks (
        string branch,
        int64 tasks_limit = 10,
        string? task_owner = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/last_packages_by_tasks",
            null,
            {
                { "branch", branch.to_string () },
                { "tasks_limit", tasks_limit.to_string () },
                { "task_owner", task_owner != null ? task_owner.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackages) jsoner.deserialize_object (typeof (SiteLastPackages));
    }

    /**
     * Get information about last packages with CVE fixes mentioned in changelog
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteLastPackagesWithCVEFixes}
     */
    public SiteLastPackagesWithCVEFixes get_site_last_packages_with_cve_fixed (
        string branch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/last_packages_with_cve_fixed",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackagesWithCVEFixes) jsoner.deserialize_object (typeof (SiteLastPackagesWithCVEFixes));
    }

    /**
     * Packages collected by the specified maintainer
     * 
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<MaintainerBranches>}
     */
    public Gee.ArrayList<MaintainerBranches> get_site_maintainer_branches (
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/maintainer_branches",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerBranches> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Maintainer information
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<MaintainerInfo>}
     */
    public Gee.ArrayList<MaintainerInfo> get_site_maintainer_info (
        string branch,
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/maintainer_info",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerInfo> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Packages collected by the specified maintainer
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<MaintainerPackages>}
     */
    public Gee.ArrayList<MaintainerPackages> get_site_maintainer_packages (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/maintainer_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerPackages> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get package changelog history by hash
     * 
     * @param pkghash package hash
     * @param changelog_last changelog history length
     * 
     * @return {@link SiteChangelog}
     */
    public SiteChangelog get_site_package_changelog_pkghash (
        int64 pkghash,
        int64? changelog_last = 3,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_changelog/$pkghash",
            null,
            {
                { "changelog_last", changelog_last != null ? changelog_last.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteChangelog) jsoner.deserialize_object (typeof (SiteChangelog));
    }

    /**
     * Get package download links by source package hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * 
     * @return {@link SitePackagesDownloads}
     */
    public SitePackagesDownloads get_site_package_downloads_pkghash (
        string branch,
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_downloads/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) jsoner.deserialize_object (typeof (SitePackagesDownloads));
    }

    /**
     * Get binary package download link
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * @param arch arch of binary packages
     * 
     * @return {@link SitePackagesDownloads}
     */
    public SitePackagesDownloads get_site_package_downloads_bin_pkghash (
        string branch,
        string arch,
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_downloads_bin/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "arch", arch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) jsoner.deserialize_object (typeof (SitePackagesDownloads));
    }

    /**
     * Get package download links by source package hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * 
     * @return {@link SitePackagesDownloads}
     */
    public SitePackagesDownloads get_site_package_downloads_src_pkghash (
        string branch,
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_downloads_src/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) jsoner.deserialize_object (typeof (SitePackagesDownloads));
    }

    /**
     * Get package info by hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * @param changelog_last changelog history length
     * @param package_type packages type [source|binary]
     * 
     * @return {@link SitePackageInfo}
     */
    public SitePackageInfo get_site_package_info_pkghash (
        string branch,
        int64 pkghash,
        int64? changelog_last = 3,
        string? package_type = "source",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_info/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "changelog_last", changelog_last != null ? changelog_last.to_string () : null },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackageInfo) jsoner.deserialize_object (typeof (SitePackageInfo));
    }

    /**
     * Get brief package info by hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link SiteBriefPackageInfo}
     */
    public SiteBriefPackageInfo get_site_package_info_brief_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_info_brief/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteBriefPackageInfo) jsoner.deserialize_object (typeof (SiteBriefPackageInfo));
    }

    /**
     * Get binary package build log link
     * 
     * @param pkghash package hash
     * 
     * @return {@link BinPackageLogElement}
     */
    public BinPackageLogElement get_site_package_log_bin_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_log_bin/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BinPackageLogElement) jsoner.deserialize_object (typeof (BinPackageLogElement));
    }

    /**
     * Get binary packages file conflicts by source package.
     * 
     * @param pkghash source package hash
     * @param branch name of packageset
     * 
     * @return {@link PackageMisconflictBySrc}
     */
    public PackageMisconflictBySrc get_site_package_misconflict_pkghash (
        string branch,
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_misconflict/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageMisconflictBySrc) jsoner.deserialize_object (typeof (PackageMisconflictBySrc));
    }

    /**
     * Get source package name from repology.
     * 
     * @param branch name of packageset
     * @param name source package name
     * 
     * @return {@link PackageNameFromRepology}
     */
    public PackageNameFromRepology get_site_package_name_from_repology (
        string branch,
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_name_from_repology",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageNameFromRepology) jsoner.deserialize_object (typeof (PackageNameFromRepology));
    }

    /**
     * Get package name, version, release and type by hash. Check package name matching if provided.
     * 
     * @param pkghash package hash
     * @param name package name
     * 
     * @return {@link PackageNVRByHash}
     */
    public PackageNVRByHash get_site_package_nvr_by_hash_pkghash (
        int64 pkghash,
        string? name = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_nvr_by_hash/$pkghash",
            null,
            {
                { "name", name != null ? name.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageNVRByHash) jsoner.deserialize_object (typeof (PackageNVRByHash));
    }

    /**
     * Get source or binary package versions from last branches
     * 
     * @param name source package name
     * @param package_type packages type [source|binary]
     * @param arch arch of binary packages
     * 
     * @return {@link SiteSourcePackagesVersions}
     */
    public SiteSourcePackagesVersions get_site_package_versions (
        string name,
        string? package_type = "source",
        string? arch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_versions",
            null,
            {
                { "name", name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteSourcePackagesVersions) jsoner.deserialize_object (typeof (SiteSourcePackagesVersions));
    }

    /**
     * Get binary packages versions from images
     * 
     * @param name package name
     * @param branch image base branch
     * @param edition image edition
     * @param type image type
     * 
     * @return {@link SiteImagePackageVersions}
     */
    public SiteImagePackageVersions get_site_package_versions_from_images (
        string name,
        string branch,
        string edition,
        string type,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_versions_from_images",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "edition", edition.to_string () },
                { "type", type.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteImagePackageVersions) jsoner.deserialize_object (typeof (SiteImagePackageVersions));
    }

    /**
     * Get source package versions from tasks
     * 
     * @param name package name
     * @param branch name of packageset
     * 
     * @return {@link SItePackagesVersionsFromTasks}
     */
    public SItePackagesVersionsFromTasks get_site_package_versions_from_tasks (
        string name,
        string? branch = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/package_versions_from_tasks",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SItePackagesVersionsFromTasks) jsoner.deserialize_object (typeof (SItePackagesVersionsFromTasks));
    }

    /**
     * Get package set list by package hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link SitePackagesetsByHash}
     */
    public SitePackagesetsByHash get_site_packagesets_by_hash_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/packagesets_by_hash/$pkghash",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetsByHash) jsoner.deserialize_object (typeof (SitePackagesetsByHash));
    }

    /**
     * Get binary package hash by package name, arch and package set name
     * 
     * @param branch name of packageset
     * @param name package name
     * @param arch package arch
     * 
     * @return {@link SitePackagesetPackageHash}
     */
    public SitePackagesetPackageHash get_site_pkghash_by_binary_name (
        string branch,
        string name,
        string arch,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/pkghash_by_binary_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
                { "arch", arch.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHash) jsoner.deserialize_object (typeof (SitePackagesetPackageHash));
    }

    /**
     * Get source package hash by package name and package set name
     * 
     * @param branch name of packageset
     * @param name package name
     * 
     * @return {@link SitePackagesetPackageHash}
     */
    public SitePackagesetPackageHash get_site_pkghash_by_name (
        string branch,
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/pkghash_by_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHash) jsoner.deserialize_object (typeof (SitePackagesetPackageHash));
    }

    /**
     * Get source package hash by package name, version and release for specific branch
     * 
     * @param name package name
     * @param branch name of packageset
     * @param version source package version
     * @param release source package release
     * 
     * @return {@link SitePackagesetPackageHashByNameVersionRelease}
     */
    public SitePackagesetPackageHashByNameVersionRelease get_site_pkghash_by_nvr (
        string name,
        string branch,
        string version,
        string release,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/pkghash_by_nvr",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "version", version.to_string () },
                { "release", release.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHashByNameVersionRelease) jsoner.deserialize_object (typeof (SitePackagesetPackageHashByNameVersionRelease));
    }

    /**
     * Get list of package categories with count for given package set
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * 
     * @return {@link SitePackagesetCategories}
     */
    public SitePackagesetCategories get_site_pkgset_categories_count (
        string branch,
        string? package_type = "source",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/pkgset_categories_count",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetCategories) jsoner.deserialize_object (typeof (SitePackagesetCategories));
    }

    /**
     * Get package sets list with source packages count and status info
     * 
     * 
     * @return {@link SitePackagesetsSummaryStatus}
     */
    public SitePackagesetsSummaryStatus get_site_pkgsets_summary_status (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/pkgsets_summary_status",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetsSummaryStatus) jsoner.deserialize_object (typeof (SitePackagesetsSummaryStatus));
    }

    /**
     * Get repocop results by the maintainers nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<RepocopByMaintainer>}
     */
    public Gee.ArrayList<RepocopByMaintainer> get_site_repocop_by_maintainer (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/repocop_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<RepocopByMaintainer> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get list of packageset packages in accordance to given parameters
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * @param group package category
     * @param buildtime package buildtime
     * 
     * @return {@link SitePackages}
     */
    public SitePackages get_site_repository_packages (
        string branch,
        string? package_type = "source",
        string? group = null,
        int64? buildtime = 0,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/repository_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "group", group != null ? group.to_string () : null },
                { "buildtime", buildtime != null ? buildtime.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackages) jsoner.deserialize_object (typeof (SitePackages));
    }

    /**
     * Get source package versions from last branches
     * 
     * @param name source package name
     * 
     * @return {@link SiteSourcePackagesVersions}
     */
    public SiteSourcePackagesVersions get_site_source_package_versions (
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/source_package_versions",
            null,
            {
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteSourcePackagesVersions) jsoner.deserialize_object (typeof (SiteSourcePackagesVersions));
    }

    /**
     * Get tasks list by maintainer nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<SiteTaskByName>}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public Gee.ArrayList<SiteTaskByName> get_site_tasks_by_maintainer (
        string branch,
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/tasks_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteTaskByName> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get tasks list by source package name
     * 
     * @param name package name
     * 
     * @return {@link SiteTaskByName}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public SiteTaskByName get_site_tasks_by_package (
        string name,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/tasks_by_package",
            null,
            {
                { "name", name.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteTaskByName) jsoner.deserialize_object (typeof (SiteTaskByName));
    }

    /**
     * Get history of done tasks for an active branches
     * 
     * @param task_id Number of task id
     * 
     * @return {@link SiteTasksHistory}
     */
    public SiteTasksHistory get_site_tasks_history (
        int64? task_id = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/tasks_history",
            null,
            {
                { "task_id", task_id != null ? task_id.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteTasksHistory) jsoner.deserialize_object (typeof (SiteTasksHistory));
    }

    /**
     * Get watch packages by the maintainer's nickname
     * 
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<SiteWatchByMaintainer>}
     */
    public Gee.ArrayList<SiteWatchByMaintainer> get_site_watch_by_maintainer (
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/site/watch_by_maintainer",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteWatchByMaintainer> ();
        jsoner.deserialize_array (array);

        return array;
    }

    /**
     * Get list of packages required for build by source packages from task recursively
     * 
     * @param id task ID
     * @param arch packages architecture
     * 
     * @return {@link BuildDependencySet}
     */
    public BuildDependencySet get_task_build_dependency_set_id (
        int64 id,
        string? arch = "x86_64",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/build_dependency_set/$id",
            null,
            {
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BuildDependencySet) jsoner.deserialize_object (typeof (BuildDependencySet));
    }

    /**
     * ## Description
     * Get relation between images and binary packages:
     * - if some packages from a task are in images, they will be in **in_images** list.
     * - if some packages from a task aren't in any image, they will be in **not_in_images** list.
     * 
     * ## Arguments
     * - Allowed task's states: **EPERM**, **TESTED** or **DONE**.
     * - If parameter **packages_names** (list of binary packages names) is set, it will show only specified binary packages.
     * - You can provide multiple filters for images. If an image matches at least one filter, it will be shown.
     * 
     * ## Examples
     * Show information about all of the binary packages inside images:
     * ```json
     * {
     *     "task_id": 327143
     * }
     * ```
     * Show information about all of the binary packages inside images which edition is 'alt-kworkstation', type is 'iso' and version is '10.1.*':
     * ```json
     * {
     *     "task_id": 327143,
     *     "filters": [
     *         {
     *             "editions": ["alt-kworkstation"],
     *             "types": ["iso"],
     *             "versions": ["10.1"]
     *         }
     *     ]
     * }
     * ```
     * Show information about **liblash** binary package inside images which edition is 'alt-kworkstation' with version '10.1.*' or edition 'slinux' with version '10.2.*'.
     * ```json
     * {
     *     "task_id": 312990,
     *     "packages_names": [
     *         "liblash"
     *     ],
     *     "filters": [
     *         {
     *             "editions": ["alt-kworkstation"],
     *             "versions": ["10.1"]
     *         },
     *         {
     *             "editions": ["slinux"],
     *             "versions": ["10.2"]
     *         }
     *     ]
     * }
     * ```
     * 
     * @param payload 
     * 
     * @return {@link CheckImagesOutput}
     */
    public CheckImagesOutput post_task_check_images (
        CheckImagesInput payload,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            Jsoner.serialize (payload, Case.SNAKE)
        };

        var bytes = soup_wrapper.post (
            @"$API_BASE/task/check_images",
            null,
            post_content,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (CheckImagesOutput) jsoner.deserialize_object (typeof (CheckImagesOutput));
    }

    /**
     * Get the newest images which contain binary packages with the same names as binaries from a task with one of the following states: EPERM, TESTED or DONE. Listed only active images for task's branch.
     * 
     * @param id task ID
     * 
     * @return {@link FindImagesByTask}
     */
    public FindImagesByTask get_task_find_images_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/find_images/$id",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindImagesByTask) jsoner.deserialize_object (typeof (FindImagesByTask));
    }

    /**
     * Get information about packages from package sets by list of source packages from task
     * 
     * @param id task ID
     * @param branches list of package sets to filter result
     * 
     * @return {@link TaskFindPackageset}
     */
    public TaskFindPackageset get_task_find_packageset_id (
        int64 id,
        string[]? branches = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/find_packageset/$id",
            null,
            {
                { "branches", branches != null ? string.joinv (",", branches) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskFindPackageset) jsoner.deserialize_object (typeof (TaskFindPackageset));
    }

    /**
     * Get packages with conflicting files in packages from task that do not have a conflict in dependencies
     * 
     * @param id task ID
     * @param archs list of packages architectures
     * @param no_cache cache override value, not affect on request results
     * 
     * @return {@link TaskMisconflictPackages}
     */
    public TaskMisconflictPackages get_task_misconflict_id (
        int64 id,
        string[]? archs = null,
        string? no_cache = "",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/misconflict/$id",
            null,
            {
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskMisconflictPackages) jsoner.deserialize_object (typeof (TaskMisconflictPackages));
    }

    /**
     * Get EPERM tasks which require approval
     * 
     * @param acl_group ACL-group from which approval is required
     * @param branches list of package sets to filter result
     * @param before show tasks' info before specified datetime (YYYY-MM-DD[ HH:MM:SS])
     * 
     * @return {@link NeedsApproval}
     */
    public NeedsApproval get_task_needs_approval (
        string acl_group,
        string[]? branches = null,
        string? before = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/needs_approval",
            null,
            {
                { "acl_group", acl_group.to_string () },
                { "branches", branches != null ? string.joinv (",", branches) : null },
                { "before", before != null ? before.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (NeedsApproval) jsoner.deserialize_object (typeof (NeedsApproval));
    }

    /**
     * Get information about packages from task
     * 
     * @param id task ID
     * 
     * @return {@link TaskPackages}
     */
    public TaskPackages get_task_packages_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/packages/$id",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskPackages) jsoner.deserialize_object (typeof (TaskPackages));
    }

    /**
     * Alias for 'all_tasks_branches' for compatibility
     * 
     * 
     * @return {@link AllTasksBranches}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public AllTasksBranches get_task_progress_all_packagesets (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/all_packagesets",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (AllTasksBranches) jsoner.deserialize_object (typeof (AllTasksBranches));
    }

    /**
     * Get branches list for last tasks
     * 
     * 
     * @return {@link AllTasksBranches}
     */
    public AllTasksBranches get_task_progress_all_tasks_branches (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/all_tasks_branches",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (AllTasksBranches) jsoner.deserialize_object (typeof (AllTasksBranches));
    }

    /**
     * Task search by ID, task owner or component.
     * 
     * @param input task search arguments
     * @param owner task owner
     * @param branch name of packageset
     * @param state task state
     * @param tasks_limit number of last tasks to get
     * @param by_package find tasks by source package name
     * 
     * @return {@link TasksList}
     */
    public TasksList get_task_progress_find_tasks (
        string[] input,
        string? owner = null,
        string? branch = null,
        string[]? state = null,
        int64? tasks_limit = 100,
        bool? by_package = false,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/find_tasks",
            null,
            {
                { "input", string.joinv (",", input) },
                { "owner", owner != null ? owner.to_string () : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "state", state != null ? string.joinv (",", state) : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
                { "by_package", by_package != null ? by_package.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TasksList) jsoner.deserialize_object (typeof (TasksList));
    }

    /**
     * Task search by ID, owner, repo, state and component.
     * 
     * @param input task search arguments
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * 
     * @return {@link FindTasks}
     */
    public FindTasks get_task_progress_find_tasks_lookup (
        string[] input,
        string? branch = null,
        int64? tasks_limit = 10,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/find_tasks_lookup",
            null,
            {
                { "input", string.joinv (",", input) },
                { "branch", branch != null ? branch.to_string () : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindTasks) jsoner.deserialize_object (typeof (FindTasks));
    }

    /**
     * Get the latest tasks changes
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * 
     * @return {@link TasksList}
     */
    public TasksList get_task_progress_last_tasks (
        string? branch = null,
        int64? tasks_limit = 10,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/last_tasks",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TasksList) jsoner.deserialize_object (typeof (TasksList));
    }

    /**
     * Get information for task by ID
     * 
     * @param id task ID
     * 
     * @return {@link TaskProgressTaskInfo}
     */
    public TaskProgressTaskInfo get_task_progress_task_info_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/progress/task_info/$id",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskProgressTaskInfo) jsoner.deserialize_object (typeof (TaskProgressTaskInfo));
    }

    /**
     * Get task difference by ID
     * 
     * @param id task ID
     * 
     * @return {@link TaskDiff}
     */
    public TaskDiff get_task_task_diff_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/task_diff/$id",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskDiff) jsoner.deserialize_object (typeof (TaskDiff));
    }

    /**
     * Get done tasks history for branch
     * 
     * @param branch name of packageset
     * @param start_task start task ID
     * @param end_task end task ID
     * @param start_date task history start date (YYYY-MM-DD)
     * @param end_date task history end date (YYYY-MM-DD)
     * 
     * @return {@link TaskHistory}
     */
    public TaskHistory get_task_task_history (
        string branch,
        int64? start_task = 0,
        int64? end_task = 0,
        string? start_date = null,
        string? end_date = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/task_history",
            null,
            {
                { "branch", branch.to_string () },
                { "start_task", start_task != null ? start_task.to_string () : null },
                { "end_task", end_task != null ? end_task.to_string () : null },
                { "start_date", start_date != null ? start_date.to_string () : null },
                { "end_date", end_date != null ? end_date.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskHistory) jsoner.deserialize_object (typeof (TaskHistory));
    }

    /**
     * Get information for task by ID
     * 
     * @param id task ID
     * @param try task try
     * @param iteration task iteration
     * @param no_cache cache override value, not affect on request results
     * @param states Filter task states by given list (valid values is `DONE`, `EPERM` and `TESTED`)
     * 
     * @return {@link TaskInfo}
     */
    public TaskInfo get_task_task_info_id (
        int64 id,
        int64? try = null,
        int64? iteration = null,
        string? no_cache = "",
        string[]? states = null,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/task_info/$id",
            null,
            {
                { "try", try != null ? try.to_string () : null },
                { "iteration", iteration != null ? iteration.to_string () : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
                { "states", states != null ? string.joinv (",", states) : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskInfo) jsoner.deserialize_object (typeof (TaskInfo));
    }

    /**
     * Get repository state by ID
     * 
     * @param id task ID
     * @param include_task_packages include task packages in repository state
     * 
     * @return {@link TaskRepo}
     */
    public TaskRepo get_task_task_repo_id (
        int64 id,
        bool? include_task_packages = false,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/task_repo/$id",
            null,
            {
                { "include_task_packages", include_task_packages != null ? include_task_packages.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskRepo) jsoner.deserialize_object (typeof (TaskRepo));
    }

    /**
     * Get packages build dependencies
     * 
     * @param id task ID
     * @param depth dependency depth
     * @param dptype dependency type [source|binary|both]
     * @param archs list of packages architectures
     * @param leaf assembly dependency chain package
     * @param finite_package topological tree leaves packages
     * @param filter_by_package filter result by dependency on binary packages
     * @param filter_by_source filter result by dependency on source package
     * @param oneandhalf use dependency depth 1.5
     * @param no_cache cache override value, not affect on request results
     * 
     * @return {@link TaskBuildDependency}
     */
    public TaskBuildDependency get_task_what_depends_src_id (
        int64 id,
        int64? depth = 1,
        string? dptype = "both",
        string[]? archs = null,
        string? leaf = null,
        bool? finite_package = false,
        string[]? filter_by_package = null,
        string? filter_by_source = null,
        bool? oneandhalf = false,
        string? no_cache = "",
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/task/what_depends_src/$id",
            null,
            {
                { "depth", depth != null ? depth.to_string () : null },
                { "dptype", dptype != null ? dptype.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "leaf", leaf != null ? leaf.to_string () : null },
                { "finite_package", finite_package != null ? finite_package.to_string () : null },
                { "filter_by_package", filter_by_package != null ? string.joinv (",", filter_by_package) : null },
                { "filter_by_source", filter_by_source != null ? filter_by_source.to_string () : null },
                { "oneandhalf", oneandhalf != null ? oneandhalf.to_string () : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskBuildDependency) jsoner.deserialize_object (typeof (TaskBuildDependency));
    }

    /**
     * get API version
     * 
     * 
     * @return {@link APIVersion}
     */
    public APIVersion get_version (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/version",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (APIVersion) jsoner.deserialize_object (typeof (APIVersion));
    }

    /**
     * Get BDU information
     * 
     * @param vuln_id BDU id
     * 
     * @return {@link VulnerabilityInfo}
     */
    public VulnerabilityInfo get_vuln_bdu (
        string vuln_id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/vuln/bdu",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnerabilityInfo) jsoner.deserialize_object (typeof (VulnerabilityInfo));
    }

    /**
     * Get a list of packages in which the specified BDU vulnerability is closed.
     * 
     * @param vuln_id BDU id
     * 
     * @return {@link VulnFixesPackages}
     */
    public VulnFixesPackages get_vuln_bdu_fixes (
        string vuln_id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/vuln/bdu/fixes",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnFixesPackages) jsoner.deserialize_object (typeof (VulnFixesPackages));
    }

    /**
     * Get CVE information
     * 
     * @param vuln_id CVE id
     * 
     * @return {@link VulnerabilityInfo}
     */
    public VulnerabilityInfo get_vuln_cve (
        string vuln_id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/vuln/cve",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnerabilityInfo) jsoner.deserialize_object (typeof (VulnerabilityInfo));
    }

    /**
     * Get a list of packages in which the specified CVE vulnerability is closed.
     * 
     * @param vuln_id CVE id
     * 
     * @return {@link VulnFixesPackages}
     */
    public VulnFixesPackages get_vuln_cve_fixes (
        string vuln_id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/vuln/cve/fixes",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnFixesPackages) jsoner.deserialize_object (typeof (VulnFixesPackages));
    }

    /**
     * Get a list of fixed CVEs from an task with one of the following states: EPERM, TESTED, or DONE.
     * 
     * @param id task ID
     * 
     * @return {@link CveVulnerableTask}
     */
    public CveVulnerableTask get_vuln_task_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$API_BASE/vuln/task/$id",
            null,
            null,
            null,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (CveVulnerableTask) jsoner.deserialize_object (typeof (CveVulnerableTask));
    }

    //ASYNC

    /**
     * ACL groups for source packages list in specific branch
     * 
     * @param branch name of packageset
     * @param packages_names source packages names
     * 
     * @return {@link Gee.ArrayList<AclByPackages>}
     */
    public async Gee.ArrayList<AclByPackages> get_acl_by_packages_async (
        string branch,
        string[] packages_names,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/acl/by_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "packages_names", string.joinv (",", packages_names) },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclByPackages> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * List of ACL groups for specific branch
     * 
     * @param branch name of packageset
     * @param name ACL group name
     * 
     * @return {@link Gee.ArrayList<AclGroups>}
     */
    public async Gee.ArrayList<AclGroups> get_acl_groups_async (
        string branch,
        string? name = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/acl/groups",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name != null ? name.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclGroups> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * List the ACL groups that the given user belongs to
     * 
     * @param branch name of packageset
     * @param nickname ACL member nickname
     * 
     * @return {@link Gee.ArrayList<AclMaintainerGroups>}
     */
    public async Gee.ArrayList<AclMaintainerGroups> get_acl_maintainer_groups_async (
        string nickname,
        string[]? branch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/acl/maintainer_groups",
            null,
            {
                { "branch", branch != null ? string.joinv (",", branch) : null },
                { "nickname", nickname.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AclMaintainerGroups> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get information from bugzilla by image edition
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_image_edition_async (
        string branch,
        string edition,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/bug/bugzilla_by_image_edition",
            null,
            {
                { "branch", branch.to_string () },
                { "edition", edition.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get information from bugzilla by the maintainer nickname
     * 
     * @param maintainer_nickname maintainer nickname
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_maintainer_async (
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/bug/bugzilla_by_maintainer",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get information from bugzilla by the source package name
     * 
     * @param package_name source or binary package name
     * @param package_type packages type [source|binary]
     * 
     * @return {@link Gee.ArrayList<BugzillaInfo>}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_package_async (
        string package_name,
        string? package_type = "source",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/bug/bugzilla_by_package",
            null,
            {
                { "package_name", package_name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BugzillaInfo> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Find packages required to backport too
     * 
     * @param from_branch packageset name where are packages backported from
     * @param into_branch packageset name where are packages backported to
     * @param packages_names source packages names
     * @param dp_type type of dependency [source|binary|both]
     * @param archs architectures to show
     * 
     * @return {@link Gee.ArrayList<BackportHelper>}
     */
    public async Gee.ArrayList<BackportHelper> get_dependencies_backport_helper_async (
        string from_branch,
        string into_branch,
        string[] packages_names,
        string? dp_type = "both",
        string[]? archs = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/backport_helper",
            null,
            {
                { "from_branch", from_branch.to_string () },
                { "into_branch", into_branch.to_string () },
                { "packages_names", string.joinv (",", packages_names) },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<BackportHelper> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get binary package dependencies
     * 
     * @param pkghash package hash
     * 
     * @return {@link DependenciesPackageDependencies}
     */
    public async DependenciesPackageDependencies get_dependencies_binary_package_dependencies_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/binary_package_dependencies/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackageDependencies) yield jsoner.deserialize_object_async (typeof (DependenciesPackageDependencies));
    }

    /**
     * Fast search for dependencies by name (case sensitive)
     *         including partial occurrence.
     * 
     * @param branch packageset name
     * @param dp_name dependency name
     * @param limit number of dependencies to get
     * 
     * @return {@link FastDependencySearch}
     */
    public async FastDependencySearch get_dependencies_fast_lookup_async (
        string branch,
        string dp_name,
        int64? limit = 10,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/fast_lookup",
            null,
            {
                { "branch", branch.to_string () },
                { "dp_name", dp_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FastDependencySearch) yield jsoner.deserialize_object_async (typeof (FastDependencySearch));
    }

    /**
     * Get binary packages by dependency name and type
     * 
     * @param branch packageset name
     * @param dp_name dependency name
     * @param dp_type type of dependency [all|provide|require|conflict|obsolete]
     * 
     * @return {@link DependenciesPackages}
     */
    public async DependenciesPackages get_dependencies_packages_by_dependency_async (
        string branch,
        string dp_name,
        string? dp_type = "all",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/packages_by_dependency",
            null,
            {
                { "branch", branch.to_string () },
                { "dp_name", dp_name.to_string () },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackages) yield jsoner.deserialize_object_async (typeof (DependenciesPackages));
    }

    /**
     * Get source package build dependencies
     * 
     * @param pkghash package hash
     * @param branch packageset name
     * @param depth dependency level limit
     * 
     * @return {@link DependenciesPackageBuildDependencies}
     */
    public async DependenciesPackageBuildDependencies get_dependencies_source_package_dependencies_pkghash_async (
        string branch,
        int64 pkghash,
        int64? depth = 1,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/source_package_dependencies/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "depth", depth != null ? depth.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (DependenciesPackageBuildDependencies) yield jsoner.deserialize_object_async (typeof (DependenciesPackageBuildDependencies));
    }

    /**
     * Get packages build dependencies by set of parameters
     * 
     * @param name source package name
     * @param branch packageset name
     * @param dp_type type of dependency [source|binary|both]
     * 
     * @return {@link PackageBuildDependency}
     */
    public async PackageBuildDependency get_dependencies_what_depends_src_async (
        string name,
        string branch,
        string? dp_type = "both",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/dependencies/what_depends_src",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "dp_type", dp_type != null ? dp_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageBuildDependency) yield jsoner.deserialize_object_async (typeof (PackageBuildDependency));
    }

    /**
     * Get information about branch update erratas
     * 
     * @param payload 
     * 
     * @return {@link ErrataBranchesUpdates}
     */
    public async ErrataBranchesUpdates post_errata_branches_updates_async (
        ErrataJsonPostList payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/errata/branches_updates",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataBranchesUpdates) yield jsoner.deserialize_object_async (typeof (ErrataBranchesUpdates));
    }

    /**
     * Get list of branches form errata history.
     * 
     * 
     * @return {@link ErrataBranches}
     */
    public async ErrataBranches get_errata_errata_branches_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/errata_branches",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataBranches) yield jsoner.deserialize_object_async (typeof (ErrataBranches));
    }

    /**
     * Get branches with OVAL definitions export available
     * 
     * 
     * @return {@link OvalBranches}
     */
    public async OvalBranches get_errata_export_oval_branches_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/export/oval/branches",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (OvalBranches) yield jsoner.deserialize_object_async (typeof (OvalBranches));
    }

    /**
     * Get OVAL definitions of closed issues of branch packages
     * 
     * @param branch 
     * @param package_name source or binary package name
     * @param one_file return OVAL definitions as one XML file
     * 
     * @return {@link string}
     */
    public async string get_errata_export_oval_branch_async (
        string branch,
        string? package_name = null,
        bool? one_file = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/export/oval/$branch",
            null,
            {
                { "package_name", package_name != null ? package_name.to_string () : null },
                { "one_file", one_file != null ? one_file.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Find errata by ID, vulnerability ID or package name.
     * 
     * @param input errata search arguments
     * @param branch branch name
     * @param type errata type [packages|repository|bug|vuln]
     * @param page number page
     * @param limit number of records
     * @param state errata state
     * 
     * @return {@link ErrataLastChanged}
     */
    public async ErrataLastChanged get_errata_find_erratas_async (
        string[]? input = null,
        string? branch = null,
        string? type = null,
        int64? page = null,
        int64? limit = null,
        string? state = "all",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/find_erratas",
            null,
            {
                { "input", input != null ? string.joinv (",", input) : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "type", type != null ? type.to_string () : null },
                { "page", page != null ? page.to_string () : null },
                { "limit", limit != null ? limit.to_string () : null },
                { "state", state != null ? state.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataLastChanged) yield jsoner.deserialize_object_async (typeof (ErrataLastChanged));
    }

    /**
     * Find errata by image UUID.
     * 
     * @param uuid Image UUID
     * @param branch branch name
     * @param component Image component
     * @param input errata search arguments
     * @param type errata type [packages|repository|bug|vuln]
     * @param page number page
     * @param limit number of records
     * @param is_discarded is errata discarded
     * @param sort sort arguments
     * 
     * @return {@link ImageErrata}
     */
    public async ImageErrata get_errata_find_image_erratas_async (
        string uuid,
        string branch,
        string? component = null,
        string[]? input = null,
        string? type = null,
        int64? page = null,
        int64? limit = null,
        bool? is_discarded = false,
        string[]? sort = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/find_image_erratas",
            null,
            {
                { "uuid", uuid.to_string () },
                { "branch", branch.to_string () },
                { "component", component != null ? component.to_string () : null },
                { "input", input != null ? string.joinv (",", input) : null },
                { "type", type != null ? type.to_string () : null },
                { "page", page != null ? page.to_string () : null },
                { "limit", limit != null ? limit.to_string () : null },
                { "is_discarded", is_discarded != null ? is_discarded.to_string () : null },
                { "sort", sort != null ? string.joinv (",", sort) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageErrata) yield jsoner.deserialize_object_async (typeof (ImageErrata));
    }

    /**
     * Get list of valid Errata identifiers
     * 
     * 
     * @return {@link ErrataIdsList}
     */
    public async ErrataIdsList get_errata_ids_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/ids",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataIdsList) yield jsoner.deserialize_object_async (typeof (ErrataIdsList));
    }

    /**
     * Get information about package update erratas
     * 
     * @param payload 
     * 
     * @return {@link ErrataPackagesUpdates}
     */
    public async ErrataPackagesUpdates post_errata_packages_updates_async (
        ErrataJsonPostList payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/errata/packages_updates",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ErrataPackagesUpdates) yield jsoner.deserialize_object_async (typeof (ErrataPackagesUpdates));
    }

    /**
     * Find erratas by given arguments
     * 
     * @param branch branch name
     * @param name source package name
     * @param vuln_id CVE, BDU or Bug ID
     * @param errata_id errata ID
     * 
     * @return {@link Erratas}
     */
    public async Erratas get_errata_search_async (
        string? branch = null,
        string? name = null,
        string? vuln_id = null,
        string? errata_id = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/errata/search",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "name", name != null ? name.to_string () : null },
                { "vuln_id", vuln_id != null ? vuln_id.to_string () : null },
                { "errata_id", errata_id != null ? errata_id.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (Erratas) yield jsoner.deserialize_object_async (typeof (Erratas));
    }

    /**
     * Get branch binary packages info
     * 
     * @param branch branch name
     * @param arch package architecture
     * 
     * @return {@link PackagesetPackagesExport}
     */
    public async PackagesetPackagesExport get_export_branch_binary_packages_branch_async (
        string branch,
        string? arch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/export/branch_binary_packages/$branch",
            null,
            {
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetPackagesExport) yield jsoner.deserialize_object_async (typeof (PackagesetPackagesExport));
    }

    /**
     * Branch tree info export
     * 
     * 
     * @return {@link BranchTree}
     */
    public async BranchTree get_export_branch_tree_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/export/branch_tree",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BranchTree) yield jsoner.deserialize_object_async (typeof (BranchTree));
    }

    /**
     * Get branch info export for Repology
     * 
     * @param branch branch name
     * 
     * @return {@link RepologyExport}
     */
    public async RepologyExport get_export_repology_branch_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/export/repology/$branch",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepologyExport) yield jsoner.deserialize_object_async (typeof (RepologyExport));
    }

    /**
     * Get branch source packages for sitemap
     * 
     * @param branch branch name
     * 
     * @return {@link SitemapPackagesExport}
     */
    public async SitemapPackagesExport get_export_sitemap_packages_branch_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/export/sitemap_packages/$branch",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitemapPackagesExport) yield jsoner.deserialize_object_async (typeof (SitemapPackagesExport));
    }

    /**
     * Get an archive of PO files with package's summary and description for translation purpose
     * 
     * @param branches list of package sets to filter result
     * @param from_date take packages of branch states from date (YYYY-MM-DD)
     * 
     * @return {@link string}
     */
    public async string get_export_translation_packages_po_files_async (
        string[] branches,
        string? from_date = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/export/translation/packages_po_files",
            null,
            {
                { "branches", string.joinv (",", branches) },
                { "from_date", from_date != null ? from_date.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Fast search files by name (case sensitive) including partial occurrence.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * @param limit number of files to get
     * 
     * @return {@link FastFileSearch}
     */
    public async FastFileSearch get_file_fast_lookup_async (
        string branch,
        string file_name,
        int64? limit = 10,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/file/fast_lookup",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FastFileSearch) yield jsoner.deserialize_object_async (typeof (FastFileSearch));
    }

    /**
     * Get a list of packages to which the specified file belongs to.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * 
     * @return {@link FilePackagesByFile}
     */
    public async FilePackagesByFile get_file_packages_by_file_async (
        string branch,
        string file_name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/file/packages_by_file",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FilePackagesByFile) yield jsoner.deserialize_object_async (typeof (FilePackagesByFile));
    }

    /**
     * Find files by name (case sensitive) including partial occurrence.
     * 
     * @param branch name of packageset
     * @param file_name file name or directory
     * @param limit number of files to get
     * 
     * @return {@link Files}
     */
    public async Files get_file_search_async (
        string branch,
        string file_name,
        int64? limit = 1000,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/file/search",
            null,
            {
                { "branch", branch.to_string () },
                { "file_name", file_name.to_string () },
                { "limit", limit != null ? limit.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (Files) yield jsoner.deserialize_object_async (typeof (Files));
    }

    /**
     * Get active images for a given repository
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * @param version Image version
     * @param release Image release type
     * @param variant Image variant
     * @param type Image type
     * 
     * @return {@link ActiveImages}
     */
    public async ActiveImages get_image_active_images_async (
        string? branch = null,
        string? edition = null,
        string? version = null,
        string? release = null,
        string? variant = null,
        string? type = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/active_images",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "variant", variant != null ? variant.to_string () : null },
                { "type", type != null ? type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ActiveImages) yield jsoner.deserialize_object_async (typeof (ActiveImages));
    }

    /**
     * Get images by package name for a given repository and edition
     * 
     * @param branch name of packageset
     * @param pkg_name package name
     * @param edition Image edition
     * @param pkg_type packages type [source|binary]
     * @param img_show show images[active|all]
     * 
     * @return {@link FindImagesByPackage}
     */
    public async FindImagesByPackage get_image_find_images_by_package_name_async (
        string pkg_name,
        string? branch = null,
        string? edition = null,
        string? pkg_type = "source",
        string? img_show = "all",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/find_images_by_package_name",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "pkg_name", pkg_name.to_string () },
                { "edition", edition != null ? edition.to_string () : null },
                { "pkg_type", pkg_type != null ? pkg_type.to_string () : null },
                { "img_show", img_show != null ? img_show.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindImagesByPackage) yield jsoner.deserialize_object_async (typeof (FindImagesByPackage));
    }

    /**
     * Get list of package categories with count for image
     * 
     * @param uuid Image UUID
     * @param component Image component
     * 
     * @return {@link SiteImageCategories}
     */
    public async SiteImageCategories get_image_image_categories_count_async (
        string uuid,
        string? component = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_categories_count",
            null,
            {
                { "uuid", uuid.to_string () },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteImageCategories) yield jsoner.deserialize_object_async (typeof (SiteImageCategories));
    }

    /**
     * Get branch images info
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * @param version Image version
     * @param release Image release type
     * @param variant Image variant
     * @param flavor Image flavor
     * @param arch Image architecture
     * @param component Image component
     * @param platform Image platform
     * @param type Image type
     * 
     * @return {@link ImageInfo}
     */
    public async ImageInfo get_image_image_info_async (
        string? branch = null,
        string? edition = null,
        string? version = null,
        string? release = null,
        string? variant = null,
        string? flavor = null,
        string? arch = null,
        string? component = null,
        string? platform = null,
        string? type = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_info",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "variant", variant != null ? variant.to_string () : null },
                { "flavor", flavor != null ? flavor.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
                { "component", component != null ? component.to_string () : null },
                { "platform", platform != null ? platform.to_string () : null },
                { "type", type != null ? type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageInfo) yield jsoner.deserialize_object_async (typeof (ImageInfo));
    }

    /**
     * Get list of image packages in accordance to given parameters
     * 
     * @param uuid Image UUID
     * @param group package category
     * @param component Image component
     * 
     * @return {@link ImagePackages}
     */
    public async ImagePackages get_image_image_packages_async (
        string uuid,
        string? group = null,
        string? component = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_packages",
            null,
            {
                { "uuid", uuid.to_string () },
                { "group", group != null ? group.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackages) yield jsoner.deserialize_object_async (typeof (ImagePackages));
    }

    /**
     * Get a list of package sets which has an active images.
     * 
     * 
     * @return {@link ImagePackageSet}
     */
    public async ImagePackageSet get_image_image_packageset_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_packageset",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackageSet) yield jsoner.deserialize_object_async (typeof (ImagePackageSet));
    }

    /**
     * Get image status into database
     * 
     * 
     * @return {@link ImageStatusGet}
     */
    public async ImageStatusGet get_image_image_status_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_status",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageStatusGet) yield jsoner.deserialize_object_async (typeof (ImageStatusGet));
    }

    /**
     * Get iso image status into database
     * 
     * @param branch name of packageset
     * @param edition Image edition
     * 
     * @return {@link ImageTagStatusGet}
     */
    public async ImageTagStatusGet get_image_image_tag_status_async (
        string? branch = null,
        string? edition = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_tag_status",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "edition", edition != null ? edition.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageTagStatusGet) yield jsoner.deserialize_object_async (typeof (ImageTagStatusGet));
    }

    /**
     * Get image UUID by image tag
     * 
     * @param tag Image tag
     * 
     * @return {@link ImageTagUUID}
     */
    public async ImageTagUUID get_image_image_uuid_by_tag_async (
        string tag,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/image_uuid_by_tag",
            null,
            {
                { "tag", tag.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageTagUUID) yield jsoner.deserialize_object_async (typeof (ImageTagUUID));
    }

    /**
     * Inspect binary packages from regular distribution image
     * 
     * @param payload 
     * 
     * @return {@link ImagePackagesInspectRegular}
     */
    public async ImagePackagesInspectRegular post_image_inspect_regular_async (
        ImagePackagesJSON payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/image/inspect/regular",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackagesInspectRegular) yield jsoner.deserialize_object_async (typeof (ImagePackagesInspectRegular));
    }

    /**
     * Inspect binary packages from SP distribution image
     * 
     * @param payload 
     * 
     * @return {@link ImagePackagesInspectSP}
     */
    public async ImagePackagesInspectSP post_image_inspect_sp_async (
        ImagePackagesJSON payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/image/inspect/sp",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImagePackagesInspectSP) yield jsoner.deserialize_object_async (typeof (ImagePackagesInspectSP));
    }

    /**
     * Get all ISO images
     * 
     * 
     * @return {@link ImageAllISO}
     */
    public async ImageAllISO get_image_iso_all_images_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/iso/all_images",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ImageAllISO) yield jsoner.deserialize_object_async (typeof (ImageAllISO));
    }

    /**
     * Get list of last packages from image for given parameters
     * 
     * @param branch name of packageset
     * @param uuid Image UUID
     * @param packages_limit number of last packages to get
     * @param component Image component
     * 
     * @return {@link LastImagePackages}
     */
    public async LastImagePackages get_image_last_packages_by_image_async (
        string branch,
        string uuid,
        int64? packages_limit = null,
        string? component = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/last_packages_by_image",
            null,
            {
                { "branch", branch.to_string () },
                { "uuid", uuid.to_string () },
                { "packages_limit", packages_limit != null ? packages_limit.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LastImagePackages) yield jsoner.deserialize_object_async (typeof (LastImagePackages));
    }

    /**
     * Get information about last packages with CVE fixes mentioned in changelog for given image
     * 
     * @param branch name of packageset
     * @param uuid Image UUID
     * @param packages_limit number of last packages to get
     * @param component Image component
     * 
     * @return {@link LastImagePackages}
     */
    public async LastImagePackages get_image_last_packages_image_with_cve_fixed_async (
        string branch,
        string uuid,
        int64? packages_limit = null,
        string? component = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/image/last_packages_image_with_cve_fixed",
            null,
            {
                { "branch", branch.to_string () },
                { "uuid", uuid.to_string () },
                { "packages_limit", packages_limit != null ? packages_limit.to_string () : null },
                { "component", component != null ? component.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LastImagePackages) yield jsoner.deserialize_object_async (typeof (LastImagePackages));
    }

    /**
     * get license
     * 
     * 
     * @return {@link string}
     */
    public async string get_license_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/license",
            null,
            null,
            null,
            priority,
            cancellable
        );
        return (string) bytes.get_data ();
    }

    /**
     * Get license info by SPDX license ID
     * 
     * @param license SPDX license id
     * 
     * @return {@link LicenseInfo}
     */
    public async LicenseInfo get_license_info_async (
        string license,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/license/info",
            null,
            {
                { "license", license.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LicenseInfo) yield jsoner.deserialize_object_async (typeof (LicenseInfo));
    }

    /**
     * Get valid license tokens and SPDX license IDs
     * 
     * @param license package license string
     * 
     * @return {@link LicenseTokens}
     */
    public async LicenseTokens get_license_tokens_async (
        string license,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/license/tokens",
            null,
            {
                { "license", license.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (LicenseTokens) yield jsoner.deserialize_object_async (typeof (LicenseTokens));
    }

    /**
     * Get list of packages required for build by given source packages list recursively
     * 
     * @param branch name of packageset
     * @param packages package or list of packages
     * @param arch packages architecture
     * 
     * @return {@link BuildDependencySet}
     */
    public async BuildDependencySet get_package_build_dependency_set_async (
        string branch,
        string[] packages,
        string? arch = "x86_64",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/build_dependency_set",
            null,
            {
                { "branch", branch.to_string () },
                { "packages", string.joinv (",", packages) },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BuildDependencySet) yield jsoner.deserialize_object_async (typeof (BuildDependencySet));
    }

    /**
     * Get information about packages from package sets by given source packages list
     * 
     * @param packages package or list of packages
     * @param branches list of package sets to filter result
     * 
     * @return {@link PackageFindPackageset}
     */
    public async PackageFindPackageset get_package_find_packageset_async (
        string[] packages,
        string[]? branches = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/find_packageset",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branches", branches != null ? string.joinv (",", branches) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageFindPackageset) yield jsoner.deserialize_object_async (typeof (PackageFindPackageset));
    }

    /**
     * Get packages with conflicting files in packages that don't have a conflict in dependencies
     * 
     * @param packages package or list of packages
     * @param branch name of packageset
     * @param archs list of packages architectures
     * 
     * @return {@link PackageMisconflictPackages}
     */
    public async PackageMisconflictPackages get_package_misconflict_async (
        string[] packages,
        string branch,
        string[]? archs = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/misconflict",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branch", branch.to_string () },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageMisconflictPackages) yield jsoner.deserialize_object_async (typeof (PackageMisconflictPackages));
    }

    /**
     * Get information about binary packages from  last package sets by given file MD5 checksum and package set name
     * 
     * @param branch name of packageset
     * @param md5 file MD5 checksum
     * @param arch packages architecture
     * 
     * @return {@link PackageByFileName}
     */
    public async PackageByFileName get_package_package_by_file_md5_async (
        string branch,
        string md5,
        string? arch = "x86_64",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/package_by_file_md5",
            null,
            {
                { "branch", branch.to_string () },
                { "md5", md5.to_string () },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) yield jsoner.deserialize_object_async (typeof (PackageByFileName));
    }

    /**
     * Get information about binary packages from  last package sets by given file name and package set name.
     * File name wildcars '*' is allowed.
     * 
     * @param file file name
     * @param branch name of packageset
     * @param arch packages architecture
     * 
     * @return {@link PackageByFileName}
     */
    public async PackageByFileName get_package_package_by_file_name_async (
        string file,
        string branch,
        string? arch = "x86_64",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/package_by_file_name",
            null,
            {
                { "file", file.to_string () },
                { "branch", branch.to_string () },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) yield jsoner.deserialize_object_async (typeof (PackageByFileName));
    }

    /**
     * Get package files by hash
     * 
     * @param pkghash 
     * 
     * @return {@link PackageFiles}
     */
    public async PackageFiles get_package_package_files_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/package_files/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageFiles) yield jsoner.deserialize_object_async (typeof (PackageFiles));
    }

    /**
     * Get information for package by parameters from last packages
     * 
     * @param name package name
     * @param version package version
     * @param release package release
     * @param arch packages architecture
     * @param source is source package
     * @param branch name of packageset
     * @param disttag package disttag
     * @param sha1 package SHA1 checksum
     * @param packager package packager name
     * @param packager_email package packager email
     * @param full show full package information
     * 
     * @return {@link PackageInfo}
     */
    public async PackageInfo get_package_package_info_async (
        string? name = null,
        string? version = null,
        string? release = null,
        string? arch = "x86_64",
        bool? source = false,
        string? branch = null,
        string? disttag = null,
        string? sha1 = null,
        string? packager = null,
        string? packager_email = null,
        bool? full = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/package_info",
            null,
            {
                { "name", name != null ? name.to_string () : null },
                { "version", version != null ? version.to_string () : null },
                { "release", release != null ? release.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
                { "source", source != null ? source.to_string () : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "disttag", disttag != null ? disttag.to_string () : null },
                { "sha1", sha1 != null ? sha1.to_string () : null },
                { "packager", packager != null ? packager.to_string () : null },
                { "packager_email", packager_email != null ? packager_email.to_string () : null },
                { "full", full != null ? full.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageInfo) yield jsoner.deserialize_object_async (typeof (PackageInfo));
    }

    /**
     * Get information about binary packages from  last package sets by given file names array and package set name.
     * File name wildcars '*' is not allowed.
     * 
     * @param payload 
     * 
     * @return {@link PackageByFileName}
     */
    public async PackageByFileName post_package_packages_by_file_names_async (
        PackagesByFileNamesJson payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/package/packages_by_file_names",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageByFileName) yield jsoner.deserialize_object_async (typeof (PackageByFileName));
    }

    /**
     * Get repocop data by name, version and release
     * 
     * @param branch name of packageset
     * @param package_name source or binary package name
     * @param package_version source or binary package version
     * @param package_release source or binary package release
     * @param bin_package_arch binary package arch
     * @param package_type packages type [source|binary]
     * 
     * @return {@link RepocopJsonGetList}
     */
    public async RepocopJsonGetList get_package_repocop_async (
        string branch,
        string package_name,
        string? package_version = null,
        string? package_release = null,
        string? bin_package_arch = null,
        string? package_type = "source",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/repocop",
            null,
            {
                { "branch", branch.to_string () },
                { "package_name", package_name.to_string () },
                { "package_version", package_version != null ? package_version.to_string () : null },
                { "package_release", package_release != null ? package_release.to_string () : null },
                { "bin_package_arch", bin_package_arch != null ? bin_package_arch.to_string () : null },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepocopJsonGetList) yield jsoner.deserialize_object_async (typeof (RepocopJsonGetList));
    }

    /**
     * Get spec file by source package hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link PackageSpecfile}
     */
    public async PackageSpecfile get_package_specfile_by_hash_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/specfile_by_hash/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSpecfile) yield jsoner.deserialize_object_async (typeof (PackageSpecfile));
    }

    /**
     * Get spec file by source package name and branch
     * 
     * @param branch name of packageset
     * @param name source package name
     * 
     * @return {@link PackageSpecfile}
     */
    public async PackageSpecfile get_package_specfile_by_name_async (
        string branch,
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/specfile_by_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSpecfile) yield jsoner.deserialize_object_async (typeof (PackageSpecfile));
    }

    /**
     * Get information about unpackaged directories by maintainer nickname
     * 
     * @param branch name of packageset
     * @param packager maintainer nickname
     * @param archs list of packages architectures
     * 
     * @return {@link UnpackagedDirs}
     */
    public async UnpackagedDirs get_package_unpackaged_dirs_async (
        string branch,
        string packager,
        string[]? archs = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/unpackaged_dirs",
            null,
            {
                { "branch", branch.to_string () },
                { "packager", packager.to_string () },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (UnpackagedDirs) yield jsoner.deserialize_object_async (typeof (UnpackagedDirs));
    }

    /**
     * Get packages build dependencies by set of parameters
     * 
     * @param packages package or list of packages
     * @param branch name of packageset
     * @param depth dependency depth
     * @param dptype dependency type [source|binary|both]
     * @param archs list of packages architectures
     * @param leaf assembly dependency chain package
     * @param finite_package topological tree leaves packages
     * @param filter_by_package filter result by dependency on binary packages
     * @param filter_by_source filter result by dependency on source package
     * @param oneandhalf use dependency depth 1.5
     * @param use_last_tasks use repo state including last done tasks
     * 
     * @return {@link PackageBuildDependency}
     */
    public async PackageBuildDependency get_package_what_depends_src_async (
        string[] packages,
        string branch,
        int64? depth = 1,
        string? dptype = "both",
        string[]? archs = null,
        string? leaf = null,
        bool? finite_package = false,
        string[]? filter_by_package = null,
        string? filter_by_source = null,
        bool? oneandhalf = false,
        bool? use_last_tasks = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/package/what_depends_src",
            null,
            {
                { "packages", string.joinv (",", packages) },
                { "branch", branch.to_string () },
                { "depth", depth != null ? depth.to_string () : null },
                { "dptype", dptype != null ? dptype.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "leaf", leaf != null ? leaf.to_string () : null },
                { "finite_package", finite_package != null ? finite_package.to_string () : null },
                { "filter_by_package", filter_by_package != null ? string.joinv (",", filter_by_package) : null },
                { "filter_by_source", filter_by_source != null ? filter_by_source.to_string () : null },
                { "oneandhalf", oneandhalf != null ? oneandhalf.to_string () : null },
                { "use_last_tasks", use_last_tasks != null ? use_last_tasks.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageBuildDependency) yield jsoner.deserialize_object_async (typeof (PackageBuildDependency));
    }

    /**
     * Get list of active package sets
     * 
     * 
     * @return {@link PackageSetActivePackageSets}
     */
    public async PackageSetActivePackageSets get_packageset_active_packagesets_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/active_packagesets",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSetActivePackageSets) yield jsoner.deserialize_object_async (typeof (PackageSetActivePackageSets));
    }

    /**
     * Get difference list of packages from two package sets
     * 
     * @param pkgset1 first packageset name
     * @param pkgset2 second packageset name
     * 
     * @return {@link PackagesetCompare}
     */
    public async PackagesetCompare get_packageset_compare_packagesets_async (
        string pkgset1,
        string pkgset2,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/compare_packagesets",
            null,
            {
                { "pkgset1", pkgset1.to_string () },
                { "pkgset2", pkgset2.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetCompare) yield jsoner.deserialize_object_async (typeof (PackagesetCompare));
    }

    /**
     * Get packages by packageset component and architecture.
     * 
     * @param branch name of packageset
     * @param arch architecture name
     * @param component component name
     * 
     * @return {@link PackagesByUuid}
     */
    public async PackagesByUuid get_packageset_packages_by_component_async (
        string branch,
        string arch,
        string component,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/packages_by_component",
            null,
            {
                { "branch", branch.to_string () },
                { "arch", arch.to_string () },
                { "component", component.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesByUuid) yield jsoner.deserialize_object_async (typeof (PackagesByUuid));
    }

    /**
     * Get packages by packageset component UUID
     * 
     * @param uuid packageset component UUID
     * 
     * @return {@link PackagesByUuid}
     */
    public async PackagesByUuid get_packageset_packages_by_uuid_async (
        string uuid,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/packages_by_uuid",
            null,
            {
                { "uuid", uuid.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesByUuid) yield jsoner.deserialize_object_async (typeof (PackagesByUuid));
    }

    /**
     * Get package set status into database
     * 
     * 
     * @return {@link PackageSetStatusGet}
     */
    public async PackageSetStatusGet get_packageset_pkgset_status_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/pkgset_status",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageSetStatusGet) yield jsoner.deserialize_object_async (typeof (PackageSetStatusGet));
    }

    /**
     * Get list of packageset packages. Architecture argument is actual only if type is 'binary'.
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * @param archs list of packages architectures
     * 
     * @return {@link PackagesetPackages}
     */
    public async PackagesetPackages get_packageset_repository_packages_async (
        string branch,
        string? package_type = "all",
        string[]? archs = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/repository_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackagesetPackages) yield jsoner.deserialize_object_async (typeof (PackagesetPackages));
    }

    /**
     * Get repository statistics
     * 
     * @param branch name of packageset
     * 
     * @return {@link RepositoryStatistics}
     */
    public async RepositoryStatistics get_packageset_repository_statistics_async (
        string? branch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/packageset/repository_statistics",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (RepositoryStatistics) yield jsoner.deserialize_object_async (typeof (RepositoryStatistics));
    }

    /**
     * alias for /all_maintainers_with_nicknames
     * 
     * @param branch name of packageset
     * 
     * @return {@link Gee.ArrayList<AllMaintainers>}
     */
    public async Gee.ArrayList<AllMaintainers> get_site_all_maintainers_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_maintainers",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AllMaintainers> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * List of maintainers in branch with nicknames and source packages count
     * 
     * @param branch name of packageset
     * 
     * @return {@link Gee.ArrayList<AllMaintainers>}
     */
    public async Gee.ArrayList<AllMaintainers> get_site_all_maintainers_with_nicknames_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_maintainers_with_nicknames",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<AllMaintainers> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get binary package archs list
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteAllArchs}
     */
    public async SiteAllArchs get_site_all_pkgset_archs_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_pkgset_archs",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllArchs) yield jsoner.deserialize_object_async (typeof (SiteAllArchs));
    }

    /**
     * Get binary package archs list with source packages count
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteAllArchs}
     */
    public async SiteAllArchs get_site_all_pkgset_archs_with_src_count_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_pkgset_archs_with_src_count",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllArchs) yield jsoner.deserialize_object_async (typeof (SiteAllArchs));
    }

    /**
     * Get package sets list
     * 
     * 
     * @return {@link SiteAllPackagasets}
     */
    public async SiteAllPackagasets get_site_all_pkgsets_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_pkgsets",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagasets) yield jsoner.deserialize_object_async (typeof (SiteAllPackagasets));
    }

    /**
     * Get package sets list with source packages count
     * 
     * 
     * @return {@link SiteAllPackagesetsSummary}
     */
    public async SiteAllPackagesetsSummary get_site_all_pkgsets_summary_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_pkgsets_summary",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagesetsSummary) yield jsoner.deserialize_object_async (typeof (SiteAllPackagesetsSummary));
    }

    /**
     * Get package sets list with source packages count
     * 
     * 
     * @return {@link SiteAllPackagasets}
     */
    public async SiteAllPackagasets get_site_all_pkgsets_with_src_count_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/all_pkgsets_with_src_count",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteAllPackagasets) yield jsoner.deserialize_object_async (typeof (SiteAllPackagasets));
    }

    /**
     * Get Beehive rebuild errors by the maintainer's nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<SiteBeehiveByMaintainer>}
     */
    public async Gee.ArrayList<SiteBeehiveByMaintainer> get_site_beehive_errors_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/beehive_errors_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteBeehiveByMaintainer> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get binary package archs and versions
     * 
     * @param branch name of packageset
     * @param name binary package name
     * 
     * @return {@link SitePackagesBinaryList}
     */
    public async SitePackagesBinaryList get_site_binary_package_archs_and_versions_async (
        string branch,
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/binary_package_archs_and_versions",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesBinaryList) yield jsoner.deserialize_object_async (typeof (SitePackagesBinaryList));
    }

    /**
     * Get binary package scripts
     * 
     * @param pkghash 
     * 
     * @return {@link SiteBinPackageScripts}
     */
    public async SiteBinPackageScripts get_site_binary_package_scripts_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/binary_package_scripts/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteBinPackageScripts) yield jsoner.deserialize_object_async (typeof (SiteBinPackageScripts));
    }

    /**
     * Get information about package deleted from branch
     * 
     * @param branch name of packageset
     * @param name package name
     * @param package_type packages type [source|binary]
     * @param arch arch of binary packages
     * 
     * @return {@link SiteDeletedPackage}
     */
    public async SiteDeletedPackage get_site_deleted_package_info_async (
        string branch,
        string name,
        string? package_type = "source",
        string? arch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/deleted_package_info",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteDeletedPackage) yield jsoner.deserialize_object_async (typeof (SiteDeletedPackage));
    }

    /**
     * Fast packages search by name
     * 
     * @param name package or list of package names
     * @param branch name of packageset
     * 
     * @return {@link SiteFastPackagesSearch}
     */
    public async SiteFastPackagesSearch get_site_fast_packages_search_lookup_async (
        string[] name,
        string? branch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/fast_packages_search_lookup",
            null,
            {
                { "name", string.joinv (",", name) },
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteFastPackagesSearch) yield jsoner.deserialize_object_async (typeof (SiteFastPackagesSearch));
    }

    /**
     * Find packages by name
     * 
     * @param name package or list of package names
     * @param branch name of packageset
     * @param arch binary package arch
     * 
     * @return {@link SiteFingPackages}
     */
    public async SiteFingPackages get_site_find_packages_async (
        string[] name,
        string? branch = null,
        string? arch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/find_packages",
            null,
            {
                { "name", string.joinv (",", name) },
                { "branch", branch != null ? branch.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteFingPackages) yield jsoner.deserialize_object_async (typeof (SiteFingPackages));
    }

    /**
     * Find source package in branch by binary package name
     * 
     * @param branch name of packageset
     * @param name package name
     * 
     * @return {@link FindSourcePackageInBranch}
     */
    public async FindSourcePackageInBranch get_site_find_source_package_async (
        string branch,
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/find_source_package",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindSourcePackageInBranch) yield jsoner.deserialize_object_async (typeof (FindSourcePackageInBranch));
    }

    /**
     * Get list of last packages from tasks for given parameters
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * @param task_owner task owner's nickname
     * 
     * @return {@link SiteLastPackages}
     */
    public async SiteLastPackages get_site_last_packages_async (
        string branch,
        int64 tasks_limit = 10,
        string? task_owner = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/last_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "tasks_limit", tasks_limit.to_string () },
                { "task_owner", task_owner != null ? task_owner.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackages) yield jsoner.deserialize_object_async (typeof (SiteLastPackages));
    }

    /**
     * Get list of last packages from branch for given parameters
     * 
     * @param branch name of packageset
     * @param packages_limit number of last packages to get
     * @param packager package packager's nickname
     * 
     * @return {@link SiteLastBranchPackages}
     */
    public async SiteLastBranchPackages get_site_last_packages_by_branch_async (
        string branch,
        int64 packages_limit = 10,
        string? packager = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/last_packages_by_branch",
            null,
            {
                { "branch", branch.to_string () },
                { "packages_limit", packages_limit.to_string () },
                { "packager", packager != null ? packager.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastBranchPackages) yield jsoner.deserialize_object_async (typeof (SiteLastBranchPackages));
    }

    /**
     * Get list of last packages from tasks for given parameters
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * @param task_owner task owner's nickname
     * 
     * @return {@link SiteLastPackages}
     */
    public async SiteLastPackages get_site_last_packages_by_tasks_async (
        string branch,
        int64 tasks_limit = 10,
        string? task_owner = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/last_packages_by_tasks",
            null,
            {
                { "branch", branch.to_string () },
                { "tasks_limit", tasks_limit.to_string () },
                { "task_owner", task_owner != null ? task_owner.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackages) yield jsoner.deserialize_object_async (typeof (SiteLastPackages));
    }

    /**
     * Get information about last packages with CVE fixes mentioned in changelog
     * 
     * @param branch name of packageset
     * 
     * @return {@link SiteLastPackagesWithCVEFixes}
     */
    public async SiteLastPackagesWithCVEFixes get_site_last_packages_with_cve_fixed_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/last_packages_with_cve_fixed",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteLastPackagesWithCVEFixes) yield jsoner.deserialize_object_async (typeof (SiteLastPackagesWithCVEFixes));
    }

    /**
     * Packages collected by the specified maintainer
     * 
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<MaintainerBranches>}
     */
    public async Gee.ArrayList<MaintainerBranches> get_site_maintainer_branches_async (
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/maintainer_branches",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerBranches> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Maintainer information
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<MaintainerInfo>}
     */
    public async Gee.ArrayList<MaintainerInfo> get_site_maintainer_info_async (
        string branch,
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/maintainer_info",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerInfo> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Packages collected by the specified maintainer
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<MaintainerPackages>}
     */
    public async Gee.ArrayList<MaintainerPackages> get_site_maintainer_packages_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/maintainer_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<MaintainerPackages> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get package changelog history by hash
     * 
     * @param pkghash package hash
     * @param changelog_last changelog history length
     * 
     * @return {@link SiteChangelog}
     */
    public async SiteChangelog get_site_package_changelog_pkghash_async (
        int64 pkghash,
        int64? changelog_last = 3,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_changelog/$pkghash",
            null,
            {
                { "changelog_last", changelog_last != null ? changelog_last.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteChangelog) yield jsoner.deserialize_object_async (typeof (SiteChangelog));
    }

    /**
     * Get package download links by source package hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * 
     * @return {@link SitePackagesDownloads}
     */
    public async SitePackagesDownloads get_site_package_downloads_pkghash_async (
        string branch,
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_downloads/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) yield jsoner.deserialize_object_async (typeof (SitePackagesDownloads));
    }

    /**
     * Get binary package download link
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * @param arch arch of binary packages
     * 
     * @return {@link SitePackagesDownloads}
     */
    public async SitePackagesDownloads get_site_package_downloads_bin_pkghash_async (
        string branch,
        string arch,
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_downloads_bin/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "arch", arch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) yield jsoner.deserialize_object_async (typeof (SitePackagesDownloads));
    }

    /**
     * Get package download links by source package hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * 
     * @return {@link SitePackagesDownloads}
     */
    public async SitePackagesDownloads get_site_package_downloads_src_pkghash_async (
        string branch,
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_downloads_src/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesDownloads) yield jsoner.deserialize_object_async (typeof (SitePackagesDownloads));
    }

    /**
     * Get package info by hash
     * 
     * @param pkghash package hash
     * @param branch name of packageset
     * @param changelog_last changelog history length
     * @param package_type packages type [source|binary]
     * 
     * @return {@link SitePackageInfo}
     */
    public async SitePackageInfo get_site_package_info_pkghash_async (
        string branch,
        int64 pkghash,
        int64? changelog_last = 3,
        string? package_type = "source",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_info/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
                { "changelog_last", changelog_last != null ? changelog_last.to_string () : null },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackageInfo) yield jsoner.deserialize_object_async (typeof (SitePackageInfo));
    }

    /**
     * Get brief package info by hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link SiteBriefPackageInfo}
     */
    public async SiteBriefPackageInfo get_site_package_info_brief_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_info_brief/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteBriefPackageInfo) yield jsoner.deserialize_object_async (typeof (SiteBriefPackageInfo));
    }

    /**
     * Get binary package build log link
     * 
     * @param pkghash package hash
     * 
     * @return {@link BinPackageLogElement}
     */
    public async BinPackageLogElement get_site_package_log_bin_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_log_bin/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BinPackageLogElement) yield jsoner.deserialize_object_async (typeof (BinPackageLogElement));
    }

    /**
     * Get binary packages file conflicts by source package.
     * 
     * @param pkghash source package hash
     * @param branch name of packageset
     * 
     * @return {@link PackageMisconflictBySrc}
     */
    public async PackageMisconflictBySrc get_site_package_misconflict_pkghash_async (
        string branch,
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_misconflict/$pkghash",
            null,
            {
                { "branch", branch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageMisconflictBySrc) yield jsoner.deserialize_object_async (typeof (PackageMisconflictBySrc));
    }

    /**
     * Get source package name from repology.
     * 
     * @param branch name of packageset
     * @param name source package name
     * 
     * @return {@link PackageNameFromRepology}
     */
    public async PackageNameFromRepology get_site_package_name_from_repology_async (
        string branch,
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_name_from_repology",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageNameFromRepology) yield jsoner.deserialize_object_async (typeof (PackageNameFromRepology));
    }

    /**
     * Get package name, version, release and type by hash. Check package name matching if provided.
     * 
     * @param pkghash package hash
     * @param name package name
     * 
     * @return {@link PackageNVRByHash}
     */
    public async PackageNVRByHash get_site_package_nvr_by_hash_pkghash_async (
        int64 pkghash,
        string? name = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_nvr_by_hash/$pkghash",
            null,
            {
                { "name", name != null ? name.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (PackageNVRByHash) yield jsoner.deserialize_object_async (typeof (PackageNVRByHash));
    }

    /**
     * Get source or binary package versions from last branches
     * 
     * @param name source package name
     * @param package_type packages type [source|binary]
     * @param arch arch of binary packages
     * 
     * @return {@link SiteSourcePackagesVersions}
     */
    public async SiteSourcePackagesVersions get_site_package_versions_async (
        string name,
        string? package_type = "source",
        string? arch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_versions",
            null,
            {
                { "name", name.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteSourcePackagesVersions) yield jsoner.deserialize_object_async (typeof (SiteSourcePackagesVersions));
    }

    /**
     * Get binary packages versions from images
     * 
     * @param name package name
     * @param branch image base branch
     * @param edition image edition
     * @param type image type
     * 
     * @return {@link SiteImagePackageVersions}
     */
    public async SiteImagePackageVersions get_site_package_versions_from_images_async (
        string name,
        string branch,
        string edition,
        string type,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_versions_from_images",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "edition", edition.to_string () },
                { "type", type.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteImagePackageVersions) yield jsoner.deserialize_object_async (typeof (SiteImagePackageVersions));
    }

    /**
     * Get source package versions from tasks
     * 
     * @param name package name
     * @param branch name of packageset
     * 
     * @return {@link SItePackagesVersionsFromTasks}
     */
    public async SItePackagesVersionsFromTasks get_site_package_versions_from_tasks_async (
        string name,
        string? branch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/package_versions_from_tasks",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch != null ? branch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SItePackagesVersionsFromTasks) yield jsoner.deserialize_object_async (typeof (SItePackagesVersionsFromTasks));
    }

    /**
     * Get package set list by package hash
     * 
     * @param pkghash package hash
     * 
     * @return {@link SitePackagesetsByHash}
     */
    public async SitePackagesetsByHash get_site_packagesets_by_hash_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/packagesets_by_hash/$pkghash",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetsByHash) yield jsoner.deserialize_object_async (typeof (SitePackagesetsByHash));
    }

    /**
     * Get binary package hash by package name, arch and package set name
     * 
     * @param branch name of packageset
     * @param name package name
     * @param arch package arch
     * 
     * @return {@link SitePackagesetPackageHash}
     */
    public async SitePackagesetPackageHash get_site_pkghash_by_binary_name_async (
        string branch,
        string name,
        string arch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/pkghash_by_binary_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
                { "arch", arch.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHash) yield jsoner.deserialize_object_async (typeof (SitePackagesetPackageHash));
    }

    /**
     * Get source package hash by package name and package set name
     * 
     * @param branch name of packageset
     * @param name package name
     * 
     * @return {@link SitePackagesetPackageHash}
     */
    public async SitePackagesetPackageHash get_site_pkghash_by_name_async (
        string branch,
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/pkghash_by_name",
            null,
            {
                { "branch", branch.to_string () },
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHash) yield jsoner.deserialize_object_async (typeof (SitePackagesetPackageHash));
    }

    /**
     * Get source package hash by package name, version and release for specific branch
     * 
     * @param name package name
     * @param branch name of packageset
     * @param version source package version
     * @param release source package release
     * 
     * @return {@link SitePackagesetPackageHashByNameVersionRelease}
     */
    public async SitePackagesetPackageHashByNameVersionRelease get_site_pkghash_by_nvr_async (
        string name,
        string branch,
        string version,
        string release,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/pkghash_by_nvr",
            null,
            {
                { "name", name.to_string () },
                { "branch", branch.to_string () },
                { "version", version.to_string () },
                { "release", release.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetPackageHashByNameVersionRelease) yield jsoner.deserialize_object_async (typeof (SitePackagesetPackageHashByNameVersionRelease));
    }

    /**
     * Get list of package categories with count for given package set
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * 
     * @return {@link SitePackagesetCategories}
     */
    public async SitePackagesetCategories get_site_pkgset_categories_count_async (
        string branch,
        string? package_type = "source",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/pkgset_categories_count",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetCategories) yield jsoner.deserialize_object_async (typeof (SitePackagesetCategories));
    }

    /**
     * Get package sets list with source packages count and status info
     * 
     * 
     * @return {@link SitePackagesetsSummaryStatus}
     */
    public async SitePackagesetsSummaryStatus get_site_pkgsets_summary_status_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/pkgsets_summary_status",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackagesetsSummaryStatus) yield jsoner.deserialize_object_async (typeof (SitePackagesetsSummaryStatus));
    }

    /**
     * Get repocop results by the maintainers nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<RepocopByMaintainer>}
     */
    public async Gee.ArrayList<RepocopByMaintainer> get_site_repocop_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/repocop_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<RepocopByMaintainer> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get list of packageset packages in accordance to given parameters
     * 
     * @param branch name of packageset
     * @param package_type packages type [source|binary|all]
     * @param group package category
     * @param buildtime package buildtime
     * 
     * @return {@link SitePackages}
     */
    public async SitePackages get_site_repository_packages_async (
        string branch,
        string? package_type = "source",
        string? group = null,
        int64? buildtime = 0,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/repository_packages",
            null,
            {
                { "branch", branch.to_string () },
                { "package_type", package_type != null ? package_type.to_string () : null },
                { "group", group != null ? group.to_string () : null },
                { "buildtime", buildtime != null ? buildtime.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SitePackages) yield jsoner.deserialize_object_async (typeof (SitePackages));
    }

    /**
     * Get source package versions from last branches
     * 
     * @param name source package name
     * 
     * @return {@link SiteSourcePackagesVersions}
     */
    public async SiteSourcePackagesVersions get_site_source_package_versions_async (
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/source_package_versions",
            null,
            {
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteSourcePackagesVersions) yield jsoner.deserialize_object_async (typeof (SiteSourcePackagesVersions));
    }

    /**
     * Get tasks list by maintainer nickname
     * 
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * 
     * @return {@link Gee.ArrayList<SiteTaskByName>}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public async Gee.ArrayList<SiteTaskByName> get_site_tasks_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/tasks_by_maintainer",
            null,
            {
                { "branch", branch.to_string () },
                { "maintainer_nickname", maintainer_nickname.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteTaskByName> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get tasks list by source package name
     * 
     * @param name package name
     * 
     * @return {@link SiteTaskByName}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public async SiteTaskByName get_site_tasks_by_package_async (
        string name,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/tasks_by_package",
            null,
            {
                { "name", name.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteTaskByName) yield jsoner.deserialize_object_async (typeof (SiteTaskByName));
    }

    /**
     * Get history of done tasks for an active branches
     * 
     * @param task_id Number of task id
     * 
     * @return {@link SiteTasksHistory}
     */
    public async SiteTasksHistory get_site_tasks_history_async (
        int64? task_id = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/tasks_history",
            null,
            {
                { "task_id", task_id != null ? task_id.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (SiteTasksHistory) yield jsoner.deserialize_object_async (typeof (SiteTasksHistory));
    }

    /**
     * Get watch packages by the maintainer's nickname
     * 
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     * 
     * @return {@link Gee.ArrayList<SiteWatchByMaintainer>}
     */
    public async Gee.ArrayList<SiteWatchByMaintainer> get_site_watch_by_maintainer_async (
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/site/watch_by_maintainer",
            null,
            {
                { "maintainer_nickname", maintainer_nickname.to_string () },
                { "by_acl", by_acl != null ? by_acl.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        var array = new Gee.ArrayList<SiteWatchByMaintainer> ();
        yield jsoner.deserialize_array_async (array);

        return array;
    }

    /**
     * Get list of packages required for build by source packages from task recursively
     * 
     * @param id task ID
     * @param arch packages architecture
     * 
     * @return {@link BuildDependencySet}
     */
    public async BuildDependencySet get_task_build_dependency_set_id_async (
        int64 id,
        string? arch = "x86_64",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/build_dependency_set/$id",
            null,
            {
                { "arch", arch != null ? arch.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (BuildDependencySet) yield jsoner.deserialize_object_async (typeof (BuildDependencySet));
    }

    /**
     * ## Description
     * Get relation between images and binary packages:
     * - if some packages from a task are in images, they will be in **in_images** list.
     * - if some packages from a task aren't in any image, they will be in **not_in_images** list.
     * 
     * ## Arguments
     * - Allowed task's states: **EPERM**, **TESTED** or **DONE**.
     * - If parameter **packages_names** (list of binary packages names) is set, it will show only specified binary packages.
     * - You can provide multiple filters for images. If an image matches at least one filter, it will be shown.
     * 
     * ## Examples
     * Show information about all of the binary packages inside images:
     * ```json
     * {
     *     "task_id": 327143
     * }
     * ```
     * Show information about all of the binary packages inside images which edition is 'alt-kworkstation', type is 'iso' and version is '10.1.*':
     * ```json
     * {
     *     "task_id": 327143,
     *     "filters": [
     *         {
     *             "editions": ["alt-kworkstation"],
     *             "types": ["iso"],
     *             "versions": ["10.1"]
     *         }
     *     ]
     * }
     * ```
     * Show information about **liblash** binary package inside images which edition is 'alt-kworkstation' with version '10.1.*' or edition 'slinux' with version '10.2.*'.
     * ```json
     * {
     *     "task_id": 312990,
     *     "packages_names": [
     *         "liblash"
     *     ],
     *     "filters": [
     *         {
     *             "editions": ["alt-kworkstation"],
     *             "versions": ["10.1"]
     *         },
     *         {
     *             "editions": ["slinux"],
     *             "versions": ["10.2"]
     *         }
     *     ]
     * }
     * ```
     * 
     * @param payload 
     * 
     * @return {@link CheckImagesOutput}
     */
    public async CheckImagesOutput post_task_check_images_async (
        CheckImagesInput payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        PostContent post_content = {
            PostContentType.JSON,
            yield Jsoner.serialize_async (payload, Case.SNAKE)
        };

        var bytes = yield soup_wrapper.post_async (
            @"$API_BASE/task/check_images",
            null,
            post_content,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (CheckImagesOutput) yield jsoner.deserialize_object_async (typeof (CheckImagesOutput));
    }

    /**
     * Get the newest images which contain binary packages with the same names as binaries from a task with one of the following states: EPERM, TESTED or DONE. Listed only active images for task's branch.
     * 
     * @param id task ID
     * 
     * @return {@link FindImagesByTask}
     */
    public async FindImagesByTask get_task_find_images_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/find_images/$id",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindImagesByTask) yield jsoner.deserialize_object_async (typeof (FindImagesByTask));
    }

    /**
     * Get information about packages from package sets by list of source packages from task
     * 
     * @param id task ID
     * @param branches list of package sets to filter result
     * 
     * @return {@link TaskFindPackageset}
     */
    public async TaskFindPackageset get_task_find_packageset_id_async (
        int64 id,
        string[]? branches = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/find_packageset/$id",
            null,
            {
                { "branches", branches != null ? string.joinv (",", branches) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskFindPackageset) yield jsoner.deserialize_object_async (typeof (TaskFindPackageset));
    }

    /**
     * Get packages with conflicting files in packages from task that do not have a conflict in dependencies
     * 
     * @param id task ID
     * @param archs list of packages architectures
     * @param no_cache cache override value, not affect on request results
     * 
     * @return {@link TaskMisconflictPackages}
     */
    public async TaskMisconflictPackages get_task_misconflict_id_async (
        int64 id,
        string[]? archs = null,
        string? no_cache = "",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/misconflict/$id",
            null,
            {
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskMisconflictPackages) yield jsoner.deserialize_object_async (typeof (TaskMisconflictPackages));
    }

    /**
     * Get EPERM tasks which require approval
     * 
     * @param acl_group ACL-group from which approval is required
     * @param branches list of package sets to filter result
     * @param before show tasks' info before specified datetime (YYYY-MM-DD[ HH:MM:SS])
     * 
     * @return {@link NeedsApproval}
     */
    public async NeedsApproval get_task_needs_approval_async (
        string acl_group,
        string[]? branches = null,
        string? before = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/needs_approval",
            null,
            {
                { "acl_group", acl_group.to_string () },
                { "branches", branches != null ? string.joinv (",", branches) : null },
                { "before", before != null ? before.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (NeedsApproval) yield jsoner.deserialize_object_async (typeof (NeedsApproval));
    }

    /**
     * Get information about packages from task
     * 
     * @param id task ID
     * 
     * @return {@link TaskPackages}
     */
    public async TaskPackages get_task_packages_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/packages/$id",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskPackages) yield jsoner.deserialize_object_async (typeof (TaskPackages));
    }

    /**
     * Alias for 'all_tasks_branches' for compatibility
     * 
     * 
     * @return {@link AllTasksBranches}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public async AllTasksBranches get_task_progress_all_packagesets_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/all_packagesets",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (AllTasksBranches) yield jsoner.deserialize_object_async (typeof (AllTasksBranches));
    }

    /**
     * Get branches list for last tasks
     * 
     * 
     * @return {@link AllTasksBranches}
     */
    public async AllTasksBranches get_task_progress_all_tasks_branches_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/all_tasks_branches",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (AllTasksBranches) yield jsoner.deserialize_object_async (typeof (AllTasksBranches));
    }

    /**
     * Task search by ID, task owner or component.
     * 
     * @param input task search arguments
     * @param owner task owner
     * @param branch name of packageset
     * @param state task state
     * @param tasks_limit number of last tasks to get
     * @param by_package find tasks by source package name
     * 
     * @return {@link TasksList}
     */
    public async TasksList get_task_progress_find_tasks_async (
        string[] input,
        string? owner = null,
        string? branch = null,
        string[]? state = null,
        int64? tasks_limit = 100,
        bool? by_package = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/find_tasks",
            null,
            {
                { "input", string.joinv (",", input) },
                { "owner", owner != null ? owner.to_string () : null },
                { "branch", branch != null ? branch.to_string () : null },
                { "state", state != null ? string.joinv (",", state) : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
                { "by_package", by_package != null ? by_package.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TasksList) yield jsoner.deserialize_object_async (typeof (TasksList));
    }

    /**
     * Task search by ID, owner, repo, state and component.
     * 
     * @param input task search arguments
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * 
     * @return {@link FindTasks}
     */
    public async FindTasks get_task_progress_find_tasks_lookup_async (
        string[] input,
        string? branch = null,
        int64? tasks_limit = 10,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/find_tasks_lookup",
            null,
            {
                { "input", string.joinv (",", input) },
                { "branch", branch != null ? branch.to_string () : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (FindTasks) yield jsoner.deserialize_object_async (typeof (FindTasks));
    }

    /**
     * Get the latest tasks changes
     * 
     * @param branch name of packageset
     * @param tasks_limit number of last tasks to get
     * 
     * @return {@link TasksList}
     */
    public async TasksList get_task_progress_last_tasks_async (
        string? branch = null,
        int64? tasks_limit = 10,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/last_tasks",
            null,
            {
                { "branch", branch != null ? branch.to_string () : null },
                { "tasks_limit", tasks_limit != null ? tasks_limit.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TasksList) yield jsoner.deserialize_object_async (typeof (TasksList));
    }

    /**
     * Get information for task by ID
     * 
     * @param id task ID
     * 
     * @return {@link TaskProgressTaskInfo}
     */
    public async TaskProgressTaskInfo get_task_progress_task_info_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/progress/task_info/$id",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskProgressTaskInfo) yield jsoner.deserialize_object_async (typeof (TaskProgressTaskInfo));
    }

    /**
     * Get task difference by ID
     * 
     * @param id task ID
     * 
     * @return {@link TaskDiff}
     */
    public async TaskDiff get_task_task_diff_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/task_diff/$id",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskDiff) yield jsoner.deserialize_object_async (typeof (TaskDiff));
    }

    /**
     * Get done tasks history for branch
     * 
     * @param branch name of packageset
     * @param start_task start task ID
     * @param end_task end task ID
     * @param start_date task history start date (YYYY-MM-DD)
     * @param end_date task history end date (YYYY-MM-DD)
     * 
     * @return {@link TaskHistory}
     */
    public async TaskHistory get_task_task_history_async (
        string branch,
        int64? start_task = 0,
        int64? end_task = 0,
        string? start_date = null,
        string? end_date = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/task_history",
            null,
            {
                { "branch", branch.to_string () },
                { "start_task", start_task != null ? start_task.to_string () : null },
                { "end_task", end_task != null ? end_task.to_string () : null },
                { "start_date", start_date != null ? start_date.to_string () : null },
                { "end_date", end_date != null ? end_date.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskHistory) yield jsoner.deserialize_object_async (typeof (TaskHistory));
    }

    /**
     * Get information for task by ID
     * 
     * @param id task ID
     * @param try task try
     * @param iteration task iteration
     * @param no_cache cache override value, not affect on request results
     * @param states Filter task states by given list (valid values is `DONE`, `EPERM` and `TESTED`)
     * 
     * @return {@link TaskInfo}
     */
    public async TaskInfo get_task_task_info_id_async (
        int64 id,
        int64? try = null,
        int64? iteration = null,
        string? no_cache = "",
        string[]? states = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/task_info/$id",
            null,
            {
                { "try", try != null ? try.to_string () : null },
                { "iteration", iteration != null ? iteration.to_string () : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
                { "states", states != null ? string.joinv (",", states) : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskInfo) yield jsoner.deserialize_object_async (typeof (TaskInfo));
    }

    /**
     * Get repository state by ID
     * 
     * @param id task ID
     * @param include_task_packages include task packages in repository state
     * 
     * @return {@link TaskRepo}
     */
    public async TaskRepo get_task_task_repo_id_async (
        int64 id,
        bool? include_task_packages = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/task_repo/$id",
            null,
            {
                { "include_task_packages", include_task_packages != null ? include_task_packages.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskRepo) yield jsoner.deserialize_object_async (typeof (TaskRepo));
    }

    /**
     * Get packages build dependencies
     * 
     * @param id task ID
     * @param depth dependency depth
     * @param dptype dependency type [source|binary|both]
     * @param archs list of packages architectures
     * @param leaf assembly dependency chain package
     * @param finite_package topological tree leaves packages
     * @param filter_by_package filter result by dependency on binary packages
     * @param filter_by_source filter result by dependency on source package
     * @param oneandhalf use dependency depth 1.5
     * @param no_cache cache override value, not affect on request results
     * 
     * @return {@link TaskBuildDependency}
     */
    public async TaskBuildDependency get_task_what_depends_src_id_async (
        int64 id,
        int64? depth = 1,
        string? dptype = "both",
        string[]? archs = null,
        string? leaf = null,
        bool? finite_package = false,
        string[]? filter_by_package = null,
        string? filter_by_source = null,
        bool? oneandhalf = false,
        string? no_cache = "",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/task/what_depends_src/$id",
            null,
            {
                { "depth", depth != null ? depth.to_string () : null },
                { "dptype", dptype != null ? dptype.to_string () : null },
                { "archs", archs != null ? string.joinv (",", archs) : null },
                { "leaf", leaf != null ? leaf.to_string () : null },
                { "finite_package", finite_package != null ? finite_package.to_string () : null },
                { "filter_by_package", filter_by_package != null ? string.joinv (",", filter_by_package) : null },
                { "filter_by_source", filter_by_source != null ? filter_by_source.to_string () : null },
                { "oneandhalf", oneandhalf != null ? oneandhalf.to_string () : null },
                { "no_cache", no_cache != null ? no_cache.to_string () : null },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (TaskBuildDependency) yield jsoner.deserialize_object_async (typeof (TaskBuildDependency));
    }

    /**
     * get API version
     * 
     * 
     * @return {@link APIVersion}
     */
    public async APIVersion get_version_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/version",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (APIVersion) yield jsoner.deserialize_object_async (typeof (APIVersion));
    }

    /**
     * Get BDU information
     * 
     * @param vuln_id BDU id
     * 
     * @return {@link VulnerabilityInfo}
     */
    public async VulnerabilityInfo get_vuln_bdu_async (
        string vuln_id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/vuln/bdu",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnerabilityInfo) yield jsoner.deserialize_object_async (typeof (VulnerabilityInfo));
    }

    /**
     * Get a list of packages in which the specified BDU vulnerability is closed.
     * 
     * @param vuln_id BDU id
     * 
     * @return {@link VulnFixesPackages}
     */
    public async VulnFixesPackages get_vuln_bdu_fixes_async (
        string vuln_id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/vuln/bdu/fixes",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnFixesPackages) yield jsoner.deserialize_object_async (typeof (VulnFixesPackages));
    }

    /**
     * Get CVE information
     * 
     * @param vuln_id CVE id
     * 
     * @return {@link VulnerabilityInfo}
     */
    public async VulnerabilityInfo get_vuln_cve_async (
        string vuln_id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/vuln/cve",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnerabilityInfo) yield jsoner.deserialize_object_async (typeof (VulnerabilityInfo));
    }

    /**
     * Get a list of packages in which the specified CVE vulnerability is closed.
     * 
     * @param vuln_id CVE id
     * 
     * @return {@link VulnFixesPackages}
     */
    public async VulnFixesPackages get_vuln_cve_fixes_async (
        string vuln_id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/vuln/cve/fixes",
            null,
            {
                { "vuln_id", vuln_id.to_string () },
            },
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (VulnFixesPackages) yield jsoner.deserialize_object_async (typeof (VulnFixesPackages));
    }

    /**
     * Get a list of fixed CVEs from an task with one of the following states: EPERM, TESTED, or DONE.
     * 
     * @param id task ID
     * 
     * @return {@link CveVulnerableTask}
     */
    public async CveVulnerableTask get_vuln_task_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$API_BASE/vuln/task/$id",
            null,
            null,
            null,
            priority,
            cancellable
        );
        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (CveVulnerableTask) yield jsoner.deserialize_object_async (typeof (CveVulnerableTask));
    }
}
