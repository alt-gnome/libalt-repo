// ind-check=skip-file
// vala-lint=skip-file

using ApiBase;

AltRepo.Client client;

public int main (string[] args) {
    Test.init (ref args);

    client = new AltRepo.Client ();

    Test.add_func ("/client/license", () => {
        try {
            var version = client.get_license ();

            if (!version.has_prefix ("GNU AFFERO GENERAL PUBLIC LICENSE")) {
                Test.fail_printf ("Unexpected license: %s", version);
            }

        } catch (Error e) {
            Test.fail_printf (e.domain.to_string () + ": " + e.message);
        }
    });

    Test.add_func ("/client/version", () => {
        try {
            var version = client.get_version ();

            if (version.name != "ALTRepo API") {
                Test.fail_printf ("Unexpected version: %s", version.name);
            }

        } catch (Error e) {
            Test.fail_printf (e.domain.to_string () + ": " + e.message);
        }
    });

    return Test.run ();
}
