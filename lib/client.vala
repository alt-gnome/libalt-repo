/*
 * Copyright (C) 2025 Vladimir Vaskov
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

    Session session { get; default = new Session (); }

    construct {

    }

    public void add_headers_preset (string preset_name, Header[] headers_arr) {
        session.add_headers_preset (preset_name, headers_arr);
    }

    /**
     * ACL groups for source packages list in specific branch
     *
     * @param branch name of packageset
     * @param packages_names source packages names
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<AclByPackages> get_acl_by_packages (
        string branch,
        string[] packages_names,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/by_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        var _packages_names = new string[packages_names.length];
        for (int i = 0; i < packages_names.length; i++) {
            _packages_names[i] = packages_names[i].to_string ();
        }
        request.add_parameter_simple (
            "packages_names",
            string.joinv (",", _packages_names)
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<AclByPackages> ();
    }

    /**
     * List of ACL groups for specific branch
     *
     * @param branch name of packageset
     * @param name ACL group name
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<AclGroups> get_acl_groups (
        string branch,
        string? name = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/groups");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<AclGroups> ();
    }

    /**
     * List the ACL groups that the given user belongs to
     *
     * @param branch name of packageset
     * @param nickname ACL member nickname
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<AclMaintainerGroups> get_acl_maintainer_groups (
        string nickname,
        string[]? branch = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/maintainer_groups");

        if (branch != null) {
            var _branch = new string[branch.length];
            for (int i = 0; i < branch.length; i++) {
                _branch[i] = branch[i].to_string ();
            }
            request.add_parameter_simple (
                "branch",
                string.joinv (",", _branch)
            );
        }
        request.add_parameter_simple (
            "nickname",
            nickname.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<AclMaintainerGroups> ();
    }

    /**
     * Get information from bugzilla by image edition
     *
     * @param branch name of packageset
     * @param edition Image edition
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_image_edition (
        string branch,
        string edition,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_image_edition");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "edition",
            edition.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<BugzillaInfo> ();
    }

    /**
     * Get information from bugzilla by the maintainer nickname
     *
     * @param maintainer_nickname maintainer nickname
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_maintainer (
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_maintainer");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<BugzillaInfo> ();
    }

    /**
     * Get information from bugzilla by the source package name
     *
     * @param package_name source or binary package name
     * @param package_type packages type [source|binary]
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_package (
        string package_name,
        string? package_type = "source",
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_package");

        request.add_parameter_simple (
            "package_name",
            package_name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<BugzillaInfo> ();
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
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<BackportHelper> get_dependencies_backport_helper (
        string from_branch,
        string into_branch,
        string[] packages_names,
        string? dp_type = "both",
        string[]? archs = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/backport_helper");

        request.add_parameter_simple (
            "from_branch",
            from_branch.to_string ()
        );
        request.add_parameter_simple (
            "into_branch",
            into_branch.to_string ()
        );
        var _packages_names = new string[packages_names.length];
        for (int i = 0; i < packages_names.length; i++) {
            _packages_names[i] = packages_names[i].to_string ();
        }
        request.add_parameter_simple (
            "packages_names",
            string.joinv (",", _packages_names)
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<BackportHelper> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/binary_package_dependencies/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<DependenciesPackageDependencies> ();
    }

    /**
     * Fast search for dependencies by name (case sensitive)
     * including partial occurrence.
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/fast_lookup");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "dp_name",
            dp_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FastDependencySearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/packages_by_dependency");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "dp_name",
            dp_name.to_string ()
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<DependenciesPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/source_package_dependencies/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<DependenciesPackageBuildDependencies> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/what_depends_src");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageBuildDependency> ();
    }

    /**
     * Get information about branch update erratas
     *
     * @param exclude_json exclude vulnerability raw JSON from results
     * @param payload no description
     *
     * @return {@link ErrataBranchesUpdates}
     */
    public ErrataBranchesUpdates post_errata_branches_updates (
        ErrataJsonPostList payload,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/errata/branches_updates");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ErrataBranchesUpdates> ();
    }

    /**
     * Get list of branches form errata history.
     *
     *
     * @return {@link ErrataBranches}
     */
    public ErrataBranches get_errata_errata_branches (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/errata_branches");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ErrataBranches> ();
    }

    /**
     * Get branches with OVAL definitions export available
     *
     *
     * @return {@link OvalBranches}
     */
    public OvalBranches get_errata_export_oval_branches (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/export/oval/branches");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<OvalBranches> ();
    }

    /**
     * Get OVAL definitions of closed issues of branch packages
     *
     * @param branch no description
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/export/oval/$branch");

        if (package_name != null) {
            request.add_parameter_simple (
                "package_name",
                package_name.to_string ()
            );
        }
        if (one_file != null) {
            request.add_parameter_simple (
                "one_file",
                one_file.to_string ()
            );
        }

        var bytes = session.exec (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/find_erratas");

        if (input != null) {
            var _input = new string[input.length];
            for (int i = 0; i < input.length; i++) {
                _input[i] = input[i].to_string ();
            }
            request.add_parameter_simple (
                "input",
                string.joinv (",", _input)
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }
        if (page != null) {
            request.add_parameter_simple (
                "page",
                page.to_string ()
            );
        }
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }
        if (state != null) {
            request.add_parameter_simple (
                "state",
                state.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ErrataLastChanged> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/find_image_erratas");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }
        if (input != null) {
            var _input = new string[input.length];
            for (int i = 0; i < input.length; i++) {
                _input[i] = input[i].to_string ();
            }
            request.add_parameter_simple (
                "input",
                string.joinv (",", _input)
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }
        if (page != null) {
            request.add_parameter_simple (
                "page",
                page.to_string ()
            );
        }
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }
        if (is_discarded != null) {
            request.add_parameter_simple (
                "is_discarded",
                is_discarded.to_string ()
            );
        }
        if (sort != null) {
            var _sort = new string[sort.length];
            for (int i = 0; i < sort.length; i++) {
                _sort[i] = sort[i].to_string ();
            }
            request.add_parameter_simple (
                "sort",
                string.joinv (",", _sort)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageErrata> ();
    }

    /**
     * Get list of valid Errata identifiers
     *
     *
     * @return {@link ErrataIdsList}
     */
    public ErrataIdsList get_errata_ids (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/ids");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ErrataIdsList> ();
    }

    /**
     * Get information about package update erratas
     *
     * @param exclude_json exclude vulnerability raw JSON from results
     * @param payload no description
     *
     * @return {@link ErrataPackagesUpdates}
     */
    public ErrataPackagesUpdates post_errata_packages_updates (
        ErrataJsonPostList payload,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/errata/packages_updates");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ErrataPackagesUpdates> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/search");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }
        if (vuln_id != null) {
            request.add_parameter_simple (
                "vuln_id",
                vuln_id.to_string ()
            );
        }
        if (errata_id != null) {
            request.add_parameter_simple (
                "errata_id",
                errata_id.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<Erratas> ();
    }

    /**
     * Beehive rebuild errors export
     *
     * @param branch branch name
     * @param arch package architecture
     *
     * @return {@link ExportBeehiveFTBFSList}
     */
    public ExportBeehiveFTBFSList get_export_beehive_ftbfs (
        string branch,
        string? arch = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/beehive/ftbfs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ExportBeehiveFTBFSList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/branch_binary_packages/$branch");

        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackagesetPackagesExport> ();
    }

    /**
     * Branch tree info export
     *
     *
     * @return {@link BranchTree}
     */
    public BranchTree get_export_branch_tree (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/branch_tree");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<BranchTree> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/repology/$branch");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<RepologyExport> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/sitemap_packages/$branch");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitemapPackagesExport> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/translation/packages_po_files");

        var _branches = new string[branches.length];
        for (int i = 0; i < branches.length; i++) {
            _branches[i] = branches[i].to_string ();
        }
        request.add_parameter_simple (
            "branches",
            string.joinv (",", _branches)
        );
        if (from_date != null) {
            request.add_parameter_simple (
                "from_date",
                from_date.to_string ()
            );
        }

        var bytes = session.exec (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/fast_lookup");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FastFileSearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/packages_by_file");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FilePackagesByFile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/search");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<Files> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/active_images");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (variant != null) {
            request.add_parameter_simple (
                "variant",
                variant.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ActiveImages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/find_images_by_package_name");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        request.add_parameter_simple (
            "pkg_name",
            pkg_name.to_string ()
        );
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (pkg_type != null) {
            request.add_parameter_simple (
                "pkg_type",
                pkg_type.to_string ()
            );
        }
        if (img_show != null) {
            request.add_parameter_simple (
                "img_show",
                img_show.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FindImagesByPackage> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_categories_count");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteImageCategories> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_info");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (variant != null) {
            request.add_parameter_simple (
                "variant",
                variant.to_string ()
            );
        }
        if (flavor != null) {
            request.add_parameter_simple (
                "flavor",
                flavor.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }
        if (platform != null) {
            request.add_parameter_simple (
                "platform",
                platform.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_packages");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (group != null) {
            request.add_parameter_simple (
                "group",
                group.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImagePackages> ();
    }

    /**
     * Get a list of package sets which has an active images.
     *
     *
     * @return {@link ImagePackageSet}
     */
    public ImagePackageSet get_image_image_packageset (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_packageset");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImagePackageSet> ();
    }

    /**
     * Get image status into database
     *
     *
     * @return {@link ImageStatusGet}
     */
    public ImageStatusGet get_image_image_status (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_status");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_tag_status");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageTagStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_uuid_by_tag");

        request.add_parameter_simple (
            "tag",
            tag.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageTagUUID> ();
    }

    /**
     * Inspect binary packages from regular distribution image
     *
     * @param payload no description
     *
     * @return {@link ImagePackagesInspectRegular}
     */
    public ImagePackagesInspectRegular post_image_inspect_regular (
        ImagePackagesJSON payload,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/image/inspect/regular");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImagePackagesInspectRegular> ();
    }

    /**
     * Inspect binary packages from SP distribution image
     *
     * @param payload no description
     *
     * @return {@link ImagePackagesInspectSP}
     */
    public ImagePackagesInspectSP post_image_inspect_sp (
        ImagePackagesJSON payload,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/image/inspect/sp");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImagePackagesInspectSP> ();
    }

    /**
     * Get all ISO images
     *
     *
     * @return {@link ImageAllISO}
     */
    public ImageAllISO get_image_iso_all_images (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/iso/all_images");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<ImageAllISO> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/last_packages_by_image");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (packages_limit != null) {
            request.add_parameter_simple (
                "packages_limit",
                packages_limit.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<LastImagePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/last_packages_image_with_cve_fixed");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (packages_limit != null) {
            request.add_parameter_simple (
                "packages_limit",
                packages_limit.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<LastImagePackages> ();
    }

    /**
     * get license
     *
     *
     * @return {@link string}
     */
    public string get_license (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license");

        var bytes = session.exec (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license/info");

        request.add_parameter_simple (
            "license",
            license.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<LicenseInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license/tokens");

        request.add_parameter_simple (
            "license",
            license.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<LicenseTokens> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/build_dependency_set");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<BuildDependencySet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/find_packageset");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageFindPackageset> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/misconflict");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageMisconflictPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_by_file_md5");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "md5",
            md5.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageByFileName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_by_file_name");

        request.add_parameter_simple (
            "file",
            file.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageByFileName> ();
    }

    /**
     * Get package files by hash
     *
     * @param pkghash no description
     *
     * @return {@link PackageFiles}
     */
    public PackageFiles get_package_package_files_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_files/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageFiles> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_info");

        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }
        if (source != null) {
            request.add_parameter_simple (
                "source",
                source.to_string ()
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (disttag != null) {
            request.add_parameter_simple (
                "disttag",
                disttag.to_string ()
            );
        }
        if (sha1 != null) {
            request.add_parameter_simple (
                "sha1",
                sha1.to_string ()
            );
        }
        if (packager != null) {
            request.add_parameter_simple (
                "packager",
                packager.to_string ()
            );
        }
        if (packager_email != null) {
            request.add_parameter_simple (
                "packager_email",
                packager_email.to_string ()
            );
        }
        if (full != null) {
            request.add_parameter_simple (
                "full",
                full.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageInfo> ();
    }

    /**
     * Get information about binary packages from  last package sets by given file names array and package set name.
     * File name wildcars '*' is not allowed.
     *
     * @param payload no description
     *
     * @return {@link PackageByFileName}
     */
    public PackageByFileName post_package_packages_by_file_names (
        PackagesByFileNamesJson payload,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/package/packages_by_file_names");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageByFileName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/repocop");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "package_name",
            package_name.to_string ()
        );
        if (package_version != null) {
            request.add_parameter_simple (
                "package_version",
                package_version.to_string ()
            );
        }
        if (package_release != null) {
            request.add_parameter_simple (
                "package_release",
                package_release.to_string ()
            );
        }
        if (bin_package_arch != null) {
            request.add_parameter_simple (
                "bin_package_arch",
                bin_package_arch.to_string ()
            );
        }
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<RepocopJsonGetList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/specfile_by_hash/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageSpecfile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/specfile_by_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageSpecfile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/unpackaged_dirs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "packager",
            packager.to_string ()
        );
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<UnpackagedDirs> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/what_depends_src");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }
        if (dptype != null) {
            request.add_parameter_simple (
                "dptype",
                dptype.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (leaf != null) {
            request.add_parameter_simple (
                "leaf",
                leaf.to_string ()
            );
        }
        if (finite_package != null) {
            request.add_parameter_simple (
                "finite_package",
                finite_package.to_string ()
            );
        }
        if (filter_by_package != null) {
            var _filter_by_package = new string[filter_by_package.length];
            for (int i = 0; i < filter_by_package.length; i++) {
                _filter_by_package[i] = filter_by_package[i].to_string ();
            }
            request.add_parameter_simple (
                "filter_by_package",
                string.joinv (",", _filter_by_package)
            );
        }
        if (filter_by_source != null) {
            request.add_parameter_simple (
                "filter_by_source",
                filter_by_source.to_string ()
            );
        }
        if (oneandhalf != null) {
            request.add_parameter_simple (
                "oneandhalf",
                oneandhalf.to_string ()
            );
        }
        if (use_last_tasks != null) {
            request.add_parameter_simple (
                "use_last_tasks",
                use_last_tasks.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageBuildDependency> ();
    }

    /**
     * Get list of active package sets
     *
     *
     * @return {@link PackageSetActivePackageSets}
     */
    public PackageSetActivePackageSets get_packageset_active_packagesets (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/active_packagesets");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageSetActivePackageSets> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/compare_packagesets");

        request.add_parameter_simple (
            "pkgset1",
            pkgset1.to_string ()
        );
        request.add_parameter_simple (
            "pkgset2",
            pkgset2.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackagesetCompare> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/packages_by_component");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );
        request.add_parameter_simple (
            "component",
            component.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackagesByUuid> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/packages_by_uuid");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackagesByUuid> ();
    }

    /**
     * Get package set status into database
     *
     *
     * @return {@link PackageSetStatusGet}
     */
    public PackageSetStatusGet get_packageset_pkgset_status (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/pkgset_status");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageSetStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/repository_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackagesetPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/repository_statistics");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<RepositoryStatistics> ();
    }

    /**
     * alias for /all_maintainers_with_nicknames
     *
     * @param branch name of packageset
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<AllMaintainers> get_site_all_maintainers (
        string branch,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_maintainers");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<AllMaintainers> ();
    }

    /**
     * List of maintainers in branch with nicknames and source packages count
     *
     * @param branch name of packageset
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<AllMaintainers> get_site_all_maintainers_with_nicknames (
        string branch,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_maintainers_with_nicknames");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<AllMaintainers> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgset_archs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteAllArchs> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgset_archs_with_src_count");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteAllArchs> ();
    }

    /**
     * Get package sets list
     *
     *
     * @return {@link SiteAllPackagasets}
     */
    public SiteAllPackagasets get_site_all_pkgsets (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteAllPackagasets> ();
    }

    /**
     * Get package sets list with source packages count
     *
     *
     * @return {@link SiteAllPackagesetsSummary}
     */
    public SiteAllPackagesetsSummary get_site_all_pkgsets_summary (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets_summary");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteAllPackagesetsSummary> ();
    }

    /**
     * Get package sets list with source packages count
     *
     *
     * @return {@link SiteAllPackagasets}
     */
    public SiteAllPackagasets get_site_all_pkgsets_with_src_count (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets_with_src_count");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteAllPackagasets> ();
    }

    /**
     * Get Beehive rebuild errors by the maintainer's nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<SiteBeehiveByMaintainer> get_site_beehive_errors_by_maintainer (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/beehive_errors_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<SiteBeehiveByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/binary_package_archs_and_versions");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesBinaryList> ();
    }

    /**
     * Get binary package scripts
     *
     * @param pkghash no description
     *
     * @return {@link SiteBinPackageScripts}
     */
    public SiteBinPackageScripts get_site_binary_package_scripts_pkghash (
        int64 pkghash,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/binary_package_scripts/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteBinPackageScripts> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/deleted_package_info");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteDeletedPackage> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/fast_packages_search_lookup");

        var _name = new string[name.length];
        for (int i = 0; i < name.length; i++) {
            _name[i] = name[i].to_string ();
        }
        request.add_parameter_simple (
            "name",
            string.joinv (",", _name)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteFastPackagesSearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/find_packages");

        var _name = new string[name.length];
        for (int i = 0; i < name.length; i++) {
            _name[i] = name[i].to_string ();
        }
        request.add_parameter_simple (
            "name",
            string.joinv (",", _name)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteFingPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/find_source_package");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FindSourcePackageInBranch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "tasks_limit",
            tasks_limit.to_string ()
        );
        if (task_owner != null) {
            request.add_parameter_simple (
                "task_owner",
                task_owner.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteLastPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_by_branch");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "packages_limit",
            packages_limit.to_string ()
        );
        if (packager != null) {
            request.add_parameter_simple (
                "packager",
                packager.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteLastBranchPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_by_tasks");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "tasks_limit",
            tasks_limit.to_string ()
        );
        if (task_owner != null) {
            request.add_parameter_simple (
                "task_owner",
                task_owner.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteLastPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_with_cve_fixed");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteLastPackagesWithCVEFixes> ();
    }

    /**
     * Packages collected by the specified maintainer
     *
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<MaintainerBranches> get_site_maintainer_branches (
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_branches");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<MaintainerBranches> ();
    }

    /**
     * Maintainer information
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<MaintainerInfo> get_site_maintainer_info (
        string branch,
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_info");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<MaintainerInfo> ();
    }

    /**
     * Packages collected by the specified maintainer
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<MaintainerPackages> get_site_maintainer_packages (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<MaintainerPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_changelog/$pkghash");

        if (changelog_last != null) {
            request.add_parameter_simple (
                "changelog_last",
                changelog_last.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteChangelog> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads_bin/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads_src/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_info/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (changelog_last != null) {
            request.add_parameter_simple (
                "changelog_last",
                changelog_last.to_string ()
            );
        }
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_info_brief/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteBriefPackageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_log_bin/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<BinPackageLogElement> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_misconflict/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageMisconflictBySrc> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_name_from_repology");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageNameFromRepology> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_nvr_by_hash/$pkghash");

        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<PackageNVRByHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteSourcePackagesVersions> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions_from_images");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "edition",
            edition.to_string ()
        );
        request.add_parameter_simple (
            "type",
            type.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteImagePackageVersions> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions_from_tasks");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SItePackagesVersionsFromTasks> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/packagesets_by_hash/$pkghash");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetsByHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_binary_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetPackageHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetPackageHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_nvr");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "version",
            version.to_string ()
        );
        request.add_parameter_simple (
            "release",
            release.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetPackageHashByNameVersionRelease> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkgset_categories_count");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetCategories> ();
    }

    /**
     * Get package sets list with source packages count and status info
     *
     *
     * @return {@link SitePackagesetsSummaryStatus}
     */
    public SitePackagesetsSummaryStatus get_site_pkgsets_summary_status (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkgsets_summary_status");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackagesetsSummaryStatus> ();
    }

    /**
     * Get repocop results by the maintainers nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<RepocopByMaintainer> get_site_repocop_by_maintainer (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/repocop_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<RepocopByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/repository_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (group != null) {
            request.add_parameter_simple (
                "group",
                group.to_string ()
            );
        }
        if (buildtime != null) {
            request.add_parameter_simple (
                "buildtime",
                buildtime.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SitePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/source_package_versions");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteSourcePackagesVersions> ();
    }

    /**
     * Get tasks list by maintainer nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public Gee.ArrayList<SiteTaskByName> get_site_tasks_by_maintainer (
        string branch,
        string maintainer_nickname,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<SiteTaskByName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_by_package");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteTaskByName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_history");

        if (task_id != null) {
            request.add_parameter_simple (
                "task_id",
                task_id.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<SiteTasksHistory> ();
    }

    /**
     * Get watch packages by the maintainer's nickname
     *
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public Gee.ArrayList<SiteWatchByMaintainer> get_site_watch_by_maintainer (
        string maintainer_nickname,
        string? by_acl = null,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/watch_by_maintainer");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_array<SiteWatchByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/build_dependency_set/$id");

        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<BuildDependencySet> ();
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
     * json
     * {
     * "task_id": 327143
     * }
     *
     * Show information about all of the binary packages inside images which edition is 'alt-kworkstation', type is 'iso' and version is '10.1.*':
     * json
     * {
     * "task_id": 327143,
     * "filters": [
     * {
     * "editions": ["alt-kworkstation"],
     * "types": ["iso"],
     * "versions": ["10.1"]
     * }
     * ]
     * }
     *
     * Show information about **liblash** binary package inside images which edition is 'alt-kworkstation' with version '10.1.*' or edition 'slinux'
     * with version '10.2.*'.
     * json
     * {
     * "task_id": 312990,
     * "packages_names": [
     * "liblash"
     * ],
     * "filters": [
     * {
     * "editions": ["alt-kworkstation"],
     * "versions": ["10.1"]
     * },
     * {
     * "editions": ["slinux"],
     * "versions": ["10.2"]
     * }
     * ]
     * }
     *
     *
     * @param payload no description
     *
     * @return {@link CheckImagesOutput}
     */
    public CheckImagesOutput post_task_check_images (
        CheckImagesInput payload,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/task/check_images");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = Jsoner.serialize (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<CheckImagesOutput> ();
    }

    /**
     * Get the newest images which contain binary packages with the same names as binaries from a task with one of the following states: EPERM,
     * TESTED or DONE. Listed only active images for task's branch.
     *
     * @param id task ID
     *
     * @return {@link FindImagesByTask}
     */
    public FindImagesByTask get_task_find_images_id (
        int64 id,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/find_images/$id");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FindImagesByTask> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/find_packageset/$id");

        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskFindPackageset> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/misconflict/$id");

        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskMisconflictPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/needs_approval");

        request.add_parameter_simple (
            "acl_group",
            acl_group.to_string ()
        );
        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }
        if (before != null) {
            request.add_parameter_simple (
                "before",
                before.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<NeedsApproval> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/packages/$id");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/all_packagesets");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<AllTasksBranches> ();
    }

    /**
     * Get branches list for last tasks
     *
     *
     * @return {@link AllTasksBranches}
     */
    public AllTasksBranches get_task_progress_all_tasks_branches (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/all_tasks_branches");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<AllTasksBranches> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/find_tasks");

        var _input = new string[input.length];
        for (int i = 0; i < input.length; i++) {
            _input[i] = input[i].to_string ();
        }
        request.add_parameter_simple (
            "input",
            string.joinv (",", _input)
        );
        if (owner != null) {
            request.add_parameter_simple (
                "owner",
                owner.to_string ()
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (state != null) {
            var _state = new string[state.length];
            for (int i = 0; i < state.length; i++) {
                _state[i] = state[i].to_string ();
            }
            request.add_parameter_simple (
                "state",
                string.joinv (",", _state)
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }
        if (by_package != null) {
            request.add_parameter_simple (
                "by_package",
                by_package.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TasksList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/find_tasks_lookup");

        var _input = new string[input.length];
        for (int i = 0; i < input.length; i++) {
            _input[i] = input[i].to_string ();
        }
        request.add_parameter_simple (
            "input",
            string.joinv (",", _input)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<FindTasks> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/last_tasks");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TasksList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/task_info/$id");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskProgressTaskInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_diff/$id");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskDiff> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_history");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (start_task != null) {
            request.add_parameter_simple (
                "start_task",
                start_task.to_string ()
            );
        }
        if (end_task != null) {
            request.add_parameter_simple (
                "end_task",
                end_task.to_string ()
            );
        }
        if (start_date != null) {
            request.add_parameter_simple (
                "start_date",
                start_date.to_string ()
            );
        }
        if (end_date != null) {
            request.add_parameter_simple (
                "end_date",
                end_date.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskHistory> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_info/$id");

        if (try != null) {
            request.add_parameter_simple (
                "try",
                try.to_string ()
            );
        }
        if (iteration != null) {
            request.add_parameter_simple (
                "iteration",
                iteration.to_string ()
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }
        if (states != null) {
            var _states = new string[states.length];
            for (int i = 0; i < states.length; i++) {
                _states[i] = states[i].to_string ();
            }
            request.add_parameter_simple (
                "states",
                string.joinv (",", _states)
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_repo/$id");

        if (include_task_packages != null) {
            request.add_parameter_simple (
                "include_task_packages",
                include_task_packages.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskRepo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/what_depends_src/$id");

        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }
        if (dptype != null) {
            request.add_parameter_simple (
                "dptype",
                dptype.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (leaf != null) {
            request.add_parameter_simple (
                "leaf",
                leaf.to_string ()
            );
        }
        if (finite_package != null) {
            request.add_parameter_simple (
                "finite_package",
                finite_package.to_string ()
            );
        }
        if (filter_by_package != null) {
            var _filter_by_package = new string[filter_by_package.length];
            for (int i = 0; i < filter_by_package.length; i++) {
                _filter_by_package[i] = filter_by_package[i].to_string ();
            }
            request.add_parameter_simple (
                "filter_by_package",
                string.joinv (",", _filter_by_package)
            );
        }
        if (filter_by_source != null) {
            request.add_parameter_simple (
                "filter_by_source",
                filter_by_source.to_string ()
            );
        }
        if (oneandhalf != null) {
            request.add_parameter_simple (
                "oneandhalf",
                oneandhalf.to_string ()
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<TaskBuildDependency> ();
    }

    /**
     * get API version
     *
     *
     * @return {@link APIVersion}
     */
    public APIVersion get_version (
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/version");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<APIVersion> ();
    }

    /**
     * Get BDU information
     *
     * @param vuln_id BDU id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnerabilityInfo}
     */
    public VulnerabilityInfo get_vuln_bdu (
        string vuln_id,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/bdu");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<VulnerabilityInfo> ();
    }

    /**
     * Get a list of packages in which the specified BDU vulnerability is closed.
     *
     * @param vuln_id BDU id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnFixesPackages}
     */
    public VulnFixesPackages get_vuln_bdu_fixes (
        string vuln_id,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/bdu/fixes");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<VulnFixesPackages> ();
    }

    /**
     * Get CVE information
     *
     * @param vuln_id CVE id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnerabilityInfo}
     */
    public VulnerabilityInfo get_vuln_cve (
        string vuln_id,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/cve");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<VulnerabilityInfo> ();
    }

    /**
     * Get a list of packages in which the specified CVE vulnerability is closed.
     *
     * @param vuln_id CVE id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnFixesPackages}
     */
    public VulnFixesPackages get_vuln_cve_fixes (
        string vuln_id,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/cve/fixes");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<VulnFixesPackages> ();
    }

    /**
     * Get GHSA information
     *
     * @param vuln_id GHSA id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link string}
     */
    public string get_vuln_ghsa (
        string vuln_id,
        bool? exclude_json = false,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/ghsa");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = session.exec (
            request,
            cancellable
        );

        return (string) bytes.get_data ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/task/$id");

        var bytes = session.exec (
            request,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return jsoner.deserialize_object<CveVulnerableTask> ();
    }

    //ASYNC

    /**
     * ACL groups for source packages list in specific branch
     *
     * @param branch name of packageset
     * @param packages_names source packages names
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<AclByPackages> get_acl_by_packages_async (
        string branch,
        string[] packages_names,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/by_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        var _packages_names = new string[packages_names.length];
        for (int i = 0; i < packages_names.length; i++) {
            _packages_names[i] = packages_names[i].to_string ();
        }
        request.add_parameter_simple (
            "packages_names",
            string.joinv (",", _packages_names)
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<AclByPackages> ();
    }

    /**
     * List of ACL groups for specific branch
     *
     * @param branch name of packageset
     * @param name ACL group name
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<AclGroups> get_acl_groups_async (
        string branch,
        string? name = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/groups");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<AclGroups> ();
    }

    /**
     * List the ACL groups that the given user belongs to
     *
     * @param branch name of packageset
     * @param nickname ACL member nickname
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<AclMaintainerGroups> get_acl_maintainer_groups_async (
        string nickname,
        string[]? branch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/acl/maintainer_groups");

        if (branch != null) {
            var _branch = new string[branch.length];
            for (int i = 0; i < branch.length; i++) {
                _branch[i] = branch[i].to_string ();
            }
            request.add_parameter_simple (
                "branch",
                string.joinv (",", _branch)
            );
        }
        request.add_parameter_simple (
            "nickname",
            nickname.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<AclMaintainerGroups> ();
    }

    /**
     * Get information from bugzilla by image edition
     *
     * @param branch name of packageset
     * @param edition Image edition
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_image_edition_async (
        string branch,
        string edition,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_image_edition");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "edition",
            edition.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<BugzillaInfo> ();
    }

    /**
     * Get information from bugzilla by the maintainer nickname
     *
     * @param maintainer_nickname maintainer nickname
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_maintainer_async (
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_maintainer");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<BugzillaInfo> ();
    }

    /**
     * Get information from bugzilla by the source package name
     *
     * @param package_name source or binary package name
     * @param package_type packages type [source|binary]
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<BugzillaInfo> get_bug_bugzilla_by_package_async (
        string package_name,
        string? package_type = "source",
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/bug/bugzilla_by_package");

        request.add_parameter_simple (
            "package_name",
            package_name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<BugzillaInfo> ();
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
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<BackportHelper> get_dependencies_backport_helper_async (
        string from_branch,
        string into_branch,
        string[] packages_names,
        string? dp_type = "both",
        string[]? archs = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/backport_helper");

        request.add_parameter_simple (
            "from_branch",
            from_branch.to_string ()
        );
        request.add_parameter_simple (
            "into_branch",
            into_branch.to_string ()
        );
        var _packages_names = new string[packages_names.length];
        for (int i = 0; i < packages_names.length; i++) {
            _packages_names[i] = packages_names[i].to_string ();
        }
        request.add_parameter_simple (
            "packages_names",
            string.joinv (",", _packages_names)
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<BackportHelper> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/binary_package_dependencies/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<DependenciesPackageDependencies> ();
    }

    /**
     * Fast search for dependencies by name (case sensitive)
     * including partial occurrence.
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/fast_lookup");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "dp_name",
            dp_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FastDependencySearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/packages_by_dependency");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "dp_name",
            dp_name.to_string ()
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<DependenciesPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/source_package_dependencies/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<DependenciesPackageBuildDependencies> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/dependencies/what_depends_src");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (dp_type != null) {
            request.add_parameter_simple (
                "dp_type",
                dp_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageBuildDependency> ();
    }

    /**
     * Get information about branch update erratas
     *
     * @param exclude_json exclude vulnerability raw JSON from results
     * @param payload no description
     *
     * @return {@link ErrataBranchesUpdates}
     */
    public async ErrataBranchesUpdates post_errata_branches_updates_async (
        ErrataJsonPostList payload,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/errata/branches_updates");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ErrataBranchesUpdates> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/errata_branches");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ErrataBranches> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/export/oval/branches");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<OvalBranches> ();
    }

    /**
     * Get OVAL definitions of closed issues of branch packages
     *
     * @param branch no description
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/export/oval/$branch");

        if (package_name != null) {
            request.add_parameter_simple (
                "package_name",
                package_name.to_string ()
            );
        }
        if (one_file != null) {
            request.add_parameter_simple (
                "one_file",
                one_file.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/find_erratas");

        if (input != null) {
            var _input = new string[input.length];
            for (int i = 0; i < input.length; i++) {
                _input[i] = input[i].to_string ();
            }
            request.add_parameter_simple (
                "input",
                string.joinv (",", _input)
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }
        if (page != null) {
            request.add_parameter_simple (
                "page",
                page.to_string ()
            );
        }
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }
        if (state != null) {
            request.add_parameter_simple (
                "state",
                state.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ErrataLastChanged> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/find_image_erratas");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }
        if (input != null) {
            var _input = new string[input.length];
            for (int i = 0; i < input.length; i++) {
                _input[i] = input[i].to_string ();
            }
            request.add_parameter_simple (
                "input",
                string.joinv (",", _input)
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }
        if (page != null) {
            request.add_parameter_simple (
                "page",
                page.to_string ()
            );
        }
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }
        if (is_discarded != null) {
            request.add_parameter_simple (
                "is_discarded",
                is_discarded.to_string ()
            );
        }
        if (sort != null) {
            var _sort = new string[sort.length];
            for (int i = 0; i < sort.length; i++) {
                _sort[i] = sort[i].to_string ();
            }
            request.add_parameter_simple (
                "sort",
                string.joinv (",", _sort)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageErrata> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/ids");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ErrataIdsList> ();
    }

    /**
     * Get information about package update erratas
     *
     * @param exclude_json exclude vulnerability raw JSON from results
     * @param payload no description
     *
     * @return {@link ErrataPackagesUpdates}
     */
    public async ErrataPackagesUpdates post_errata_packages_updates_async (
        ErrataJsonPostList payload,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/errata/packages_updates");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ErrataPackagesUpdates> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/errata/search");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }
        if (vuln_id != null) {
            request.add_parameter_simple (
                "vuln_id",
                vuln_id.to_string ()
            );
        }
        if (errata_id != null) {
            request.add_parameter_simple (
                "errata_id",
                errata_id.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<Erratas> ();
    }

    /**
     * Beehive rebuild errors export
     *
     * @param branch branch name
     * @param arch package architecture
     *
     * @return {@link ExportBeehiveFTBFSList}
     */
    public async ExportBeehiveFTBFSList get_export_beehive_ftbfs_async (
        string branch,
        string? arch = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/beehive/ftbfs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ExportBeehiveFTBFSList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/branch_binary_packages/$branch");

        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackagesetPackagesExport> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/branch_tree");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<BranchTree> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/repology/$branch");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<RepologyExport> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/sitemap_packages/$branch");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitemapPackagesExport> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/export/translation/packages_po_files");

        var _branches = new string[branches.length];
        for (int i = 0; i < branches.length; i++) {
            _branches[i] = branches[i].to_string ();
        }
        request.add_parameter_simple (
            "branches",
            string.joinv (",", _branches)
        );
        if (from_date != null) {
            request.add_parameter_simple (
                "from_date",
                from_date.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/fast_lookup");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FastFileSearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/packages_by_file");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FilePackagesByFile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/file/search");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "file_name",
            file_name.to_string ()
        );
        if (limit != null) {
            request.add_parameter_simple (
                "limit",
                limit.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<Files> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/active_images");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (variant != null) {
            request.add_parameter_simple (
                "variant",
                variant.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ActiveImages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/find_images_by_package_name");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        request.add_parameter_simple (
            "pkg_name",
            pkg_name.to_string ()
        );
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (pkg_type != null) {
            request.add_parameter_simple (
                "pkg_type",
                pkg_type.to_string ()
            );
        }
        if (img_show != null) {
            request.add_parameter_simple (
                "img_show",
                img_show.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FindImagesByPackage> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_categories_count");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteImageCategories> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_info");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (variant != null) {
            request.add_parameter_simple (
                "variant",
                variant.to_string ()
            );
        }
        if (flavor != null) {
            request.add_parameter_simple (
                "flavor",
                flavor.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }
        if (platform != null) {
            request.add_parameter_simple (
                "platform",
                platform.to_string ()
            );
        }
        if (type != null) {
            request.add_parameter_simple (
                "type",
                type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_packages");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (group != null) {
            request.add_parameter_simple (
                "group",
                group.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImagePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_packageset");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImagePackageSet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_status");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_tag_status");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (edition != null) {
            request.add_parameter_simple (
                "edition",
                edition.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageTagStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/image_uuid_by_tag");

        request.add_parameter_simple (
            "tag",
            tag.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageTagUUID> ();
    }

    /**
     * Inspect binary packages from regular distribution image
     *
     * @param payload no description
     *
     * @return {@link ImagePackagesInspectRegular}
     */
    public async ImagePackagesInspectRegular post_image_inspect_regular_async (
        ImagePackagesJSON payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/image/inspect/regular");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImagePackagesInspectRegular> ();
    }

    /**
     * Inspect binary packages from SP distribution image
     *
     * @param payload no description
     *
     * @return {@link ImagePackagesInspectSP}
     */
    public async ImagePackagesInspectSP post_image_inspect_sp_async (
        ImagePackagesJSON payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/image/inspect/sp");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImagePackagesInspectSP> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/iso/all_images");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<ImageAllISO> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/last_packages_by_image");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (packages_limit != null) {
            request.add_parameter_simple (
                "packages_limit",
                packages_limit.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<LastImagePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/image/last_packages_image_with_cve_fixed");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );
        if (packages_limit != null) {
            request.add_parameter_simple (
                "packages_limit",
                packages_limit.to_string ()
            );
        }
        if (component != null) {
            request.add_parameter_simple (
                "component",
                component.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<LastImagePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license");

        var bytes = yield session.exec_async (
            request,
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license/info");

        request.add_parameter_simple (
            "license",
            license.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<LicenseInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/license/tokens");

        request.add_parameter_simple (
            "license",
            license.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<LicenseTokens> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/build_dependency_set");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<BuildDependencySet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/find_packageset");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageFindPackageset> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/misconflict");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageMisconflictPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_by_file_md5");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "md5",
            md5.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageByFileName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_by_file_name");

        request.add_parameter_simple (
            "file",
            file.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageByFileName> ();
    }

    /**
     * Get package files by hash
     *
     * @param pkghash no description
     *
     * @return {@link PackageFiles}
     */
    public async PackageFiles get_package_package_files_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_files/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageFiles> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/package_info");

        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }
        if (version != null) {
            request.add_parameter_simple (
                "version",
                version.to_string ()
            );
        }
        if (release != null) {
            request.add_parameter_simple (
                "release",
                release.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }
        if (source != null) {
            request.add_parameter_simple (
                "source",
                source.to_string ()
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (disttag != null) {
            request.add_parameter_simple (
                "disttag",
                disttag.to_string ()
            );
        }
        if (sha1 != null) {
            request.add_parameter_simple (
                "sha1",
                sha1.to_string ()
            );
        }
        if (packager != null) {
            request.add_parameter_simple (
                "packager",
                packager.to_string ()
            );
        }
        if (packager_email != null) {
            request.add_parameter_simple (
                "packager_email",
                packager_email.to_string ()
            );
        }
        if (full != null) {
            request.add_parameter_simple (
                "full",
                full.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageInfo> ();
    }

    /**
     * Get information about binary packages from  last package sets by given file names array and package set name.
     * File name wildcars '*' is not allowed.
     *
     * @param payload no description
     *
     * @return {@link PackageByFileName}
     */
    public async PackageByFileName post_package_packages_by_file_names_async (
        PackagesByFileNamesJson payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/package/packages_by_file_names");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageByFileName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/repocop");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "package_name",
            package_name.to_string ()
        );
        if (package_version != null) {
            request.add_parameter_simple (
                "package_version",
                package_version.to_string ()
            );
        }
        if (package_release != null) {
            request.add_parameter_simple (
                "package_release",
                package_release.to_string ()
            );
        }
        if (bin_package_arch != null) {
            request.add_parameter_simple (
                "bin_package_arch",
                bin_package_arch.to_string ()
            );
        }
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<RepocopJsonGetList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/specfile_by_hash/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageSpecfile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/specfile_by_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageSpecfile> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/unpackaged_dirs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "packager",
            packager.to_string ()
        );
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<UnpackagedDirs> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/package/what_depends_src");

        var _packages = new string[packages.length];
        for (int i = 0; i < packages.length; i++) {
            _packages[i] = packages[i].to_string ();
        }
        request.add_parameter_simple (
            "packages",
            string.joinv (",", _packages)
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }
        if (dptype != null) {
            request.add_parameter_simple (
                "dptype",
                dptype.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (leaf != null) {
            request.add_parameter_simple (
                "leaf",
                leaf.to_string ()
            );
        }
        if (finite_package != null) {
            request.add_parameter_simple (
                "finite_package",
                finite_package.to_string ()
            );
        }
        if (filter_by_package != null) {
            var _filter_by_package = new string[filter_by_package.length];
            for (int i = 0; i < filter_by_package.length; i++) {
                _filter_by_package[i] = filter_by_package[i].to_string ();
            }
            request.add_parameter_simple (
                "filter_by_package",
                string.joinv (",", _filter_by_package)
            );
        }
        if (filter_by_source != null) {
            request.add_parameter_simple (
                "filter_by_source",
                filter_by_source.to_string ()
            );
        }
        if (oneandhalf != null) {
            request.add_parameter_simple (
                "oneandhalf",
                oneandhalf.to_string ()
            );
        }
        if (use_last_tasks != null) {
            request.add_parameter_simple (
                "use_last_tasks",
                use_last_tasks.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageBuildDependency> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/active_packagesets");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageSetActivePackageSets> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/compare_packagesets");

        request.add_parameter_simple (
            "pkgset1",
            pkgset1.to_string ()
        );
        request.add_parameter_simple (
            "pkgset2",
            pkgset2.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackagesetCompare> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/packages_by_component");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );
        request.add_parameter_simple (
            "component",
            component.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackagesByUuid> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/packages_by_uuid");

        request.add_parameter_simple (
            "uuid",
            uuid.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackagesByUuid> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/pkgset_status");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageSetStatusGet> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/repository_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackagesetPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/packageset/repository_statistics");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<RepositoryStatistics> ();
    }

    /**
     * alias for /all_maintainers_with_nicknames
     *
     * @param branch name of packageset
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<AllMaintainers> get_site_all_maintainers_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_maintainers");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<AllMaintainers> ();
    }

    /**
     * List of maintainers in branch with nicknames and source packages count
     *
     * @param branch name of packageset
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<AllMaintainers> get_site_all_maintainers_with_nicknames_async (
        string branch,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_maintainers_with_nicknames");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<AllMaintainers> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgset_archs");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteAllArchs> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgset_archs_with_src_count");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteAllArchs> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteAllPackagasets> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets_summary");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteAllPackagesetsSummary> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/all_pkgsets_with_src_count");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteAllPackagasets> ();
    }

    /**
     * Get Beehive rebuild errors by the maintainer's nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<SiteBeehiveByMaintainer> get_site_beehive_errors_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/beehive_errors_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<SiteBeehiveByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/binary_package_archs_and_versions");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesBinaryList> ();
    }

    /**
     * Get binary package scripts
     *
     * @param pkghash no description
     *
     * @return {@link SiteBinPackageScripts}
     */
    public async SiteBinPackageScripts get_site_binary_package_scripts_pkghash_async (
        int64 pkghash,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/binary_package_scripts/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteBinPackageScripts> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/deleted_package_info");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteDeletedPackage> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/fast_packages_search_lookup");

        var _name = new string[name.length];
        for (int i = 0; i < name.length; i++) {
            _name[i] = name[i].to_string ();
        }
        request.add_parameter_simple (
            "name",
            string.joinv (",", _name)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteFastPackagesSearch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/find_packages");

        var _name = new string[name.length];
        for (int i = 0; i < name.length; i++) {
            _name[i] = name[i].to_string ();
        }
        request.add_parameter_simple (
            "name",
            string.joinv (",", _name)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteFingPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/find_source_package");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FindSourcePackageInBranch> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "tasks_limit",
            tasks_limit.to_string ()
        );
        if (task_owner != null) {
            request.add_parameter_simple (
                "task_owner",
                task_owner.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteLastPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_by_branch");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "packages_limit",
            packages_limit.to_string ()
        );
        if (packager != null) {
            request.add_parameter_simple (
                "packager",
                packager.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteLastBranchPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_by_tasks");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "tasks_limit",
            tasks_limit.to_string ()
        );
        if (task_owner != null) {
            request.add_parameter_simple (
                "task_owner",
                task_owner.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteLastPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/last_packages_with_cve_fixed");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteLastPackagesWithCVEFixes> ();
    }

    /**
     * Packages collected by the specified maintainer
     *
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<MaintainerBranches> get_site_maintainer_branches_async (
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_branches");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<MaintainerBranches> ();
    }

    /**
     * Maintainer information
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<MaintainerInfo> get_site_maintainer_info_async (
        string branch,
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_info");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<MaintainerInfo> ();
    }

    /**
     * Packages collected by the specified maintainer
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<MaintainerPackages> get_site_maintainer_packages_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/maintainer_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<MaintainerPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_changelog/$pkghash");

        if (changelog_last != null) {
            request.add_parameter_simple (
                "changelog_last",
                changelog_last.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteChangelog> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads_bin/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_downloads_src/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesDownloads> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_info/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (changelog_last != null) {
            request.add_parameter_simple (
                "changelog_last",
                changelog_last.to_string ()
            );
        }
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_info_brief/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteBriefPackageInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_log_bin/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<BinPackageLogElement> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_misconflict/$pkghash");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageMisconflictBySrc> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_name_from_repology");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageNameFromRepology> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_nvr_by_hash/$pkghash");

        if (name != null) {
            request.add_parameter_simple (
                "name",
                name.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<PackageNVRByHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteSourcePackagesVersions> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions_from_images");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "edition",
            edition.to_string ()
        );
        request.add_parameter_simple (
            "type",
            type.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteImagePackageVersions> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/package_versions_from_tasks");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SItePackagesVersionsFromTasks> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/packagesets_by_hash/$pkghash");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetsByHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_binary_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "arch",
            arch.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetPackageHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_name");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetPackageHash> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkghash_by_nvr");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );
        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "version",
            version.to_string ()
        );
        request.add_parameter_simple (
            "release",
            release.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetPackageHashByNameVersionRelease> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkgset_categories_count");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetCategories> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/pkgsets_summary_status");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackagesetsSummaryStatus> ();
    }

    /**
     * Get repocop results by the maintainers nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<RepocopByMaintainer> get_site_repocop_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/repocop_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<RepocopByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/repository_packages");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (package_type != null) {
            request.add_parameter_simple (
                "package_type",
                package_type.to_string ()
            );
        }
        if (group != null) {
            request.add_parameter_simple (
                "group",
                group.to_string ()
            );
        }
        if (buildtime != null) {
            request.add_parameter_simple (
                "buildtime",
                buildtime.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SitePackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/source_package_versions");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteSourcePackagesVersions> ();
    }

    /**
     * Get tasks list by maintainer nickname
     *
     * @param branch name of packageset
     * @param maintainer_nickname nickname of maintainer
     *
     * @return {@link Gee.ArrayList}
     */
    [Version (deprecated = true, deprecated_since = "")]
    public async Gee.ArrayList<SiteTaskByName> get_site_tasks_by_maintainer_async (
        string branch,
        string maintainer_nickname,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_by_maintainer");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<SiteTaskByName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_by_package");

        request.add_parameter_simple (
            "name",
            name.to_string ()
        );

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteTaskByName> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/tasks_history");

        if (task_id != null) {
            request.add_parameter_simple (
                "task_id",
                task_id.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<SiteTasksHistory> ();
    }

    /**
     * Get watch packages by the maintainer's nickname
     *
     * @param maintainer_nickname nickname of maintainer
     * @param by_acl search maintainer's packages by ACL
     *
     * @return {@link Gee.ArrayList}
     */
    public async Gee.ArrayList<SiteWatchByMaintainer> get_site_watch_by_maintainer_async (
        string maintainer_nickname,
        string? by_acl = null,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/site/watch_by_maintainer");

        request.add_parameter_simple (
            "maintainer_nickname",
            maintainer_nickname.to_string ()
        );
        if (by_acl != null) {
            request.add_parameter_simple (
                "by_acl",
                by_acl.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_array_async<SiteWatchByMaintainer> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/build_dependency_set/$id");

        if (arch != null) {
            request.add_parameter_simple (
                "arch",
                arch.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<BuildDependencySet> ();
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
     * json
     * {
     * "task_id": 327143
     * }
     *
     * Show information about all of the binary packages inside images which edition is 'alt-kworkstation', type is 'iso' and version is '10.1.*':
     * json
     * {
     * "task_id": 327143,
     * "filters": [
     * {
     * "editions": ["alt-kworkstation"],
     * "types": ["iso"],
     * "versions": ["10.1"]
     * }
     * ]
     * }
     *
     * Show information about **liblash** binary package inside images which edition is 'alt-kworkstation' with version '10.1.*' or edition 'slinux'
     * with version '10.2.*'.
     * json
     * {
     * "task_id": 312990,
     * "packages_names": [
     * "liblash"
     * ],
     * "filters": [
     * {
     * "editions": ["alt-kworkstation"],
     * "versions": ["10.1"]
     * },
     * {
     * "editions": ["slinux"],
     * "versions": ["10.2"]
     * }
     * ]
     * }
     *
     *
     * @param payload no description
     *
     * @return {@link CheckImagesOutput}
     */
    public async CheckImagesOutput post_task_check_images_async (
        CheckImagesInput payload,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.POST (@"$API_BASE/task/check_images");

        var post_content = new PostContent (PostContentType.JSON);
        post_content.content = yield Jsoner.serialize_async (payload, Case.SNAKE);
        request.add_post_content (post_content);

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<CheckImagesOutput> ();
    }

    /**
     * Get the newest images which contain binary packages with the same names as binaries from a task with one of the following states: EPERM,
     * TESTED or DONE. Listed only active images for task's branch.
     *
     * @param id task ID
     *
     * @return {@link FindImagesByTask}
     */
    public async FindImagesByTask get_task_find_images_id_async (
        int64 id,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/find_images/$id");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FindImagesByTask> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/find_packageset/$id");

        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskFindPackageset> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/misconflict/$id");

        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskMisconflictPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/needs_approval");

        request.add_parameter_simple (
            "acl_group",
            acl_group.to_string ()
        );
        if (branches != null) {
            var _branches = new string[branches.length];
            for (int i = 0; i < branches.length; i++) {
                _branches[i] = branches[i].to_string ();
            }
            request.add_parameter_simple (
                "branches",
                string.joinv (",", _branches)
            );
        }
        if (before != null) {
            request.add_parameter_simple (
                "before",
                before.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<NeedsApproval> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/packages/$id");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskPackages> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/all_packagesets");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<AllTasksBranches> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/all_tasks_branches");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<AllTasksBranches> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/find_tasks");

        var _input = new string[input.length];
        for (int i = 0; i < input.length; i++) {
            _input[i] = input[i].to_string ();
        }
        request.add_parameter_simple (
            "input",
            string.joinv (",", _input)
        );
        if (owner != null) {
            request.add_parameter_simple (
                "owner",
                owner.to_string ()
            );
        }
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (state != null) {
            var _state = new string[state.length];
            for (int i = 0; i < state.length; i++) {
                _state[i] = state[i].to_string ();
            }
            request.add_parameter_simple (
                "state",
                string.joinv (",", _state)
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }
        if (by_package != null) {
            request.add_parameter_simple (
                "by_package",
                by_package.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TasksList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/find_tasks_lookup");

        var _input = new string[input.length];
        for (int i = 0; i < input.length; i++) {
            _input[i] = input[i].to_string ();
        }
        request.add_parameter_simple (
            "input",
            string.joinv (",", _input)
        );
        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<FindTasks> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/last_tasks");

        if (branch != null) {
            request.add_parameter_simple (
                "branch",
                branch.to_string ()
            );
        }
        if (tasks_limit != null) {
            request.add_parameter_simple (
                "tasks_limit",
                tasks_limit.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TasksList> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/progress/task_info/$id");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskProgressTaskInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_diff/$id");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskDiff> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_history");

        request.add_parameter_simple (
            "branch",
            branch.to_string ()
        );
        if (start_task != null) {
            request.add_parameter_simple (
                "start_task",
                start_task.to_string ()
            );
        }
        if (end_task != null) {
            request.add_parameter_simple (
                "end_task",
                end_task.to_string ()
            );
        }
        if (start_date != null) {
            request.add_parameter_simple (
                "start_date",
                start_date.to_string ()
            );
        }
        if (end_date != null) {
            request.add_parameter_simple (
                "end_date",
                end_date.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskHistory> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_info/$id");

        if (try != null) {
            request.add_parameter_simple (
                "try",
                try.to_string ()
            );
        }
        if (iteration != null) {
            request.add_parameter_simple (
                "iteration",
                iteration.to_string ()
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }
        if (states != null) {
            var _states = new string[states.length];
            for (int i = 0; i < states.length; i++) {
                _states[i] = states[i].to_string ();
            }
            request.add_parameter_simple (
                "states",
                string.joinv (",", _states)
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskInfo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/task_repo/$id");

        if (include_task_packages != null) {
            request.add_parameter_simple (
                "include_task_packages",
                include_task_packages.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskRepo> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/task/what_depends_src/$id");

        if (depth != null) {
            request.add_parameter_simple (
                "depth",
                depth.to_string ()
            );
        }
        if (dptype != null) {
            request.add_parameter_simple (
                "dptype",
                dptype.to_string ()
            );
        }
        if (archs != null) {
            var _archs = new string[archs.length];
            for (int i = 0; i < archs.length; i++) {
                _archs[i] = archs[i].to_string ();
            }
            request.add_parameter_simple (
                "archs",
                string.joinv (",", _archs)
            );
        }
        if (leaf != null) {
            request.add_parameter_simple (
                "leaf",
                leaf.to_string ()
            );
        }
        if (finite_package != null) {
            request.add_parameter_simple (
                "finite_package",
                finite_package.to_string ()
            );
        }
        if (filter_by_package != null) {
            var _filter_by_package = new string[filter_by_package.length];
            for (int i = 0; i < filter_by_package.length; i++) {
                _filter_by_package[i] = filter_by_package[i].to_string ();
            }
            request.add_parameter_simple (
                "filter_by_package",
                string.joinv (",", _filter_by_package)
            );
        }
        if (filter_by_source != null) {
            request.add_parameter_simple (
                "filter_by_source",
                filter_by_source.to_string ()
            );
        }
        if (oneandhalf != null) {
            request.add_parameter_simple (
                "oneandhalf",
                oneandhalf.to_string ()
            );
        }
        if (no_cache != null) {
            request.add_parameter_simple (
                "no_cache",
                no_cache.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<TaskBuildDependency> ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/version");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<APIVersion> ();
    }

    /**
     * Get BDU information
     *
     * @param vuln_id BDU id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnerabilityInfo}
     */
    public async VulnerabilityInfo get_vuln_bdu_async (
        string vuln_id,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/bdu");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<VulnerabilityInfo> ();
    }

    /**
     * Get a list of packages in which the specified BDU vulnerability is closed.
     *
     * @param vuln_id BDU id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnFixesPackages}
     */
    public async VulnFixesPackages get_vuln_bdu_fixes_async (
        string vuln_id,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/bdu/fixes");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<VulnFixesPackages> ();
    }

    /**
     * Get CVE information
     *
     * @param vuln_id CVE id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnerabilityInfo}
     */
    public async VulnerabilityInfo get_vuln_cve_async (
        string vuln_id,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/cve");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<VulnerabilityInfo> ();
    }

    /**
     * Get a list of packages in which the specified CVE vulnerability is closed.
     *
     * @param vuln_id CVE id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link VulnFixesPackages}
     */
    public async VulnFixesPackages get_vuln_cve_fixes_async (
        string vuln_id,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/cve/fixes");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<VulnFixesPackages> ();
    }

    /**
     * Get GHSA information
     *
     * @param vuln_id GHSA id
     * @param exclude_json exclude vulnerability raw JSON from results
     *
     * @return {@link string}
     */
    public async string get_vuln_ghsa_async (
        string vuln_id,
        bool? exclude_json = false,
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/ghsa");

        request.add_parameter_simple (
            "vuln_id",
            vuln_id.to_string ()
        );
        if (exclude_json != null) {
            request.add_parameter_simple (
                "exclude_json",
                exclude_json.to_string ()
            );
        }

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        return (string) bytes.get_data ();
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
    ) throws BadStatusCodeError, JsonError, SoupError {
        var request = new Request.GET (@"$API_BASE/vuln/task/$id");

        var bytes = yield session.exec_async (
            request,
            priority,
            cancellable
        );

        var jsoner = new Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return yield jsoner.deserialize_object_async<CveVulnerableTask> ();
    }
}
