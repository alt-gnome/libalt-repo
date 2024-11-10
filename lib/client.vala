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

using ApiBase;

public sealed class AltRepo.Client : Object {

    internal const string API_BASE = "https://rdb.altlinux.org/api/";

    SoupWrapper soup_wrapper { get; default = new SoupWrapper (); }

    construct {

    }

    public string get_license (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$(API_BASE)/license",
            null,
            null,
            null,
            cancellable
        );

        return (string) bytes.get_data ();
    }

    public ApiVersion get_version (
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = soup_wrapper.get (
            @"$(API_BASE)/version",
            null,
            null,
            null,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ApiVersion) jsoner.deserialize_object (typeof (ApiVersion));
    }

    // ASYNC

    public async string get_license_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$(API_BASE)/license",
            null,
            null,
            null,
            priority,
            cancellable
        );

        return (string) bytes.get_data ();
    }

    public async ApiVersion get_version_async (
        int priority = Priority.DEFAULT,
        Cancellable? cancellable = null
    ) throws CommonError, BadStatusCodeError {
        var bytes = yield soup_wrapper.get_async (
            @"$(API_BASE)/version",
            null,
            null,
            null,
            priority,
            cancellable
        );

        var jsoner = Jsoner.from_bytes (bytes, null, Case.SNAKE);

        return (ApiVersion) yield jsoner.deserialize_object_async (typeof (ApiVersion));
    }
}
