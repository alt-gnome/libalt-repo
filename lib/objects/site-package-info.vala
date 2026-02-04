/*
 * Copyright (C) 2026 Vladimir Vaskov
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

public class AltRepo.SitePackageInfo : Object {

    /**
     * package hash UInt64 as string
     */
    public string pkghash { get; set; }

    /**
     * request arguments
     */
    public Object request_args { get; set; }

    /**
     * package name
     */
    public string name { get; set; }

    /**
     * package version
     */
    public string version { get; set; }

    /**
     * package release
     */
    public string release { get; set; }

    /**
     * package arch
     */
    public string arch { get; set; }

    /**
     * package build time
     */
    public int64 buildtime { get; set; }

    /**
     * package build task
     */
    public int64 task { get; set; }

    /**
     * task build date (ISO 8601 format)
     */
    public string task_date { get; set; }

    /**
     * package task gear type
     */
    public string gear { get; set; }

    /**
     * package license
     */
    public string license { get; set; }

    /**
     * package group
     */
    public string category { get; set; }

    /**
     * package url
     */
    public string url { get; set; }

    /**
     * package vcs
     */
    public string vcs { get; set; }

    /**
     * package summary
     */
    public string summary { get; set; }

    /**
     * package description
     */
    public string description { get; set; }

    /**
     * package packager name
     */
    public string packager { get; set; }

    /**
     * package packager nickname
     */
    public string packager_nickname { get; set; }

    /**
     * binary packages
     */
    public Gee.ArrayList<string> acl {
        get; set;
        default = new Gee.ArrayList<string> ();
    }

    /**
     * all maintainer's nicknames
     */
    public Gee.ArrayList<string> maintainers {
        get; set;
        default = new Gee.ArrayList<string> ();
    }

    /**
     * List of source or binary packages by archs
     */
    public Gee.ArrayList<SitePackageInfoArchs> package_archs {
        get; set;
        default = new Gee.ArrayList<SitePackageInfoArchs> ();
    }

    /**
     * package tasks
     */
    public Gee.ArrayList<SitePackageTasksElement> tasks {
        get; set;
        default = new Gee.ArrayList<SitePackageTasksElement> ();
    }

    /**
     * package changelog
     */
    public Gee.ArrayList<SitePackageInfoChangelogElement> changelog {
        get; set;
        default = new Gee.ArrayList<SitePackageInfoChangelogElement> ();
    }

    /**
     * new package version
     */
    public Gee.ArrayList<SitePackageNewVersion> new_version {
        get; set;
        default = new Gee.ArrayList<SitePackageNewVersion> ();
    }

    /**
     * Beehive rebuild status
     */
    public Gee.ArrayList<SitePackageBeehiveElement> beehive {
        get; set;
        default = new Gee.ArrayList<SitePackageBeehiveElement> ();
    }

    /**
     * all the dependence of the package
     */
    public Gee.ArrayList<SitePackageDependenciesElement> dependencies {
        get; set;
        default = new Gee.ArrayList<SitePackageDependenciesElement> ();
    }

    /**
     * list of found valid license tokens
     */
    public Gee.ArrayList<SitePackageLicenseTokensElement> license_tokens {
        get; set;
        default = new Gee.ArrayList<SitePackageLicenseTokensElement> ();
    }
}
