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

public class AltRepo.AdvisoryErrataJson : Object {

    /**
     * SA errata type
     */
    public string type_ { get; set; }

    /**
     * SA errata type
     */
    public string action { get; set; }

    /**
     * is SA errata public
     */
    public bool is_public { get; set; }

    /**
     * SA errata reason
     */
    public string reason { get; set; }

    /**
     * SA errata description
     */
    public string description { get; set; }

    /**
     * vulnerability identifier
     */
    public string vuln_id { get; set; }

    /**
     * CPE string
     */
    public string vuln_cpe { get; set; }

    /**
     * list of branches
     */
    public Gee.ArrayList<string> branches {
        get; set;
        default = new Gee.ArrayList<string> ();
    }

    /**
     * package name
     */
    public string pkg_name { get; set; }

    /**
     * package EVR string
     */
    public string pkg_evr { get; set; }

    /**
     * list of package version ranges
     */
    public Gee.ArrayList<AdvisoryErrataPackageVersionRange> pkg_versions {
        get; set;
        default = new Gee.ArrayList<AdvisoryErrataPackageVersionRange> ();
    }

    /**
     * list of references
     */
    public Gee.ArrayList<AdvisoryErrataReference> references {
        get; set;
        default = new Gee.ArrayList<AdvisoryErrataReference> ();
    }

    /**
     * SA errata extra details mapping
     */
    public Object extra { get; set; }
}
