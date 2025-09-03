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

public class AltRepo.PackageInfoPackage : Object {

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
     * package SHA1 header checksum
     */
    public string sha1 { get; set; }

    /**
     * package packager name
     */
    public string packager { get; set; }

    /**
     * package packager email
     */
    public string packager_email { get; set; }

    /**
     * package arch
     */
    public string arch { get; set; }

    /**
     * package epoch
     */
    public int64 epoch { get; set; }

    /**
     * package disttag
     */
    public string disttag { get; set; }

    /**
     * is sourcepackage
     */
    public int64 sourcepackage { get; set; }

    /**
     * package file
     */
    public string filename { get; set; }

    /**
     * source package file
     */
    public string sourcerpm { get; set; }

    /**
     * package serial
     */
    public int64 serial { get; set; }

    /**
     * package build time
     */
    public int64 buildtime { get; set; }

    /**
     * build host
     */
    public string buildhost { get; set; }

    /**
     * package size
     */
    public int64 size { get; set; }

    /**
     * package archive size
     */
    public int64 archivesize { get; set; }

    /**
     * package file size
     */
    public int64 filesize { get; set; }

    /**
     * rpm version
     */
    public string rpmversion { get; set; }

    /**
     * package coockie
     */
    public string cookie { get; set; }

    /**
     * package license
     */
    public string license { get; set; }

    /**
     * package group
     */
    public string group { get; set; }

    /**
     * package url
     */
    public string url { get; set; }

    /**
     * package summary
     */
    public string summary { get; set; }

    /**
     * package description
     */
    public string description { get; set; }

    /**
     * package distribution
     */
    public string distribution { get; set; }

    /**
     * package vendor
     */
    public string vendor { get; set; }

    /**
     * package os
     */
    public string os { get; set; }

    /**
     * package gif
     */
    public string gif { get; set; }

    /**
     * package xpm
     */
    public string xpm { get; set; }

    /**
     * package icon
     */
    public string icon { get; set; }

    /**
     * package prein
     */
    public string prein { get; set; }

    /**
     * package postin
     */
    public string postin { get; set; }

    /**
     * package preun
     */
    public string preun { get; set; }

    /**
     * package postun
     */
    public string postun { get; set; }

    public Gee.ArrayList<string> preinprog {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> postinprog {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> preunprog {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> postunprog {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> buildarchs {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    /**
     * package verifyscript
     */
    public string verifyscript { get; set; }

    public Gee.ArrayList<string> verifyscriptprog {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> prefixes {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    public Gee.ArrayList<string> instprefixes {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    /**
     * package optflags
     */
    public string optflags { get; set; }

    /**
     * package disturl
     */
    public string disturl { get; set; }

    /**
     * package payload format
     */
    public string payloadformat { get; set; }

    /**
     * package payload compressor
     */
    public string payloadcompressor { get; set; }

    /**
     * package payload flags
     */
    public string payloadflags { get; set; }

    /**
     * package platform
     */
    public string platform { get; set; }

    /**
     * package changelog
     */
    public Gee.ArrayList<PackageInfoChangelogElement> changelog {
        get; set;
        default = new Gee.ArrayList<PackageInfoChangelogElement> ()
    }

    /**
     * package files
     */
    public Gee.ArrayList<string> files {
        get; set;
        default = new Gee.ArrayList<string> ()
    }

    /**
     * package dependencies
     */
    public Gee.ArrayList<PackageInfoDependencies> depends {
        get; set;
        default = new Gee.ArrayList<PackageInfoDependencies> ()
    }
}
