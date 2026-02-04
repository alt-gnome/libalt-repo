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

public class AltRepo.MaintainerScoresBatchMaintainer : Object {

    /**
     * maintainer nickname
     */
    public string nick { get; set; }

    /**
     * maintainer score (with bonuses)
     */
    public double score { get; set; }

    /**
     * base score (changelog + bugfixes)
     */
    public double base_score { get; set; }

    /**
     * number of upstream updates (alt1)
     */
    public int64 updates { get; set; }

    /**
     * number of patches/fixes
     */
    public int64 patches { get; set; }

    /**
     * number of NMU uploads
     */
    public int64 nmu { get; set; }

    /**
     * number of Bugzilla bugs fixed
     */
    public int64 bugfixes { get; set; }

    /**
     * maintainer is in current ACL
     */
    public bool in_acl { get; set; }

    /**
     * last activity date
     */
    public string last_activity { get; set; }

    /**
     * commits in last 6 months
     */
    public int64 recent_commits { get; set; }

    /**
     * recent maintainer bonus applied
     */
    public bool bonus_applied { get; set; }
}
