import ballerina/persist as _;

public type customer record {|
    readonly int id;
    string customer_key;
    string environment;
    string product_name;
    string product_base_version;
    string u2_level;
|};

public type cicd_build record {|
    readonly string id;
    string ci_result;
    string cd_result;
    string event_timestamp;

    // one-to-many relationship with ci_build
    ci_build[] ci_builds;

    // one-to-many relationship with cd_build
    cd_build[] cd_builds;
|};

public type ci_build record {|
    readonly int id;
    int ci_build_id;
    string ci_status;
    string product;
    string version;
    string update_level;
    string event_timestamp;

    // many-to-one relationship with cicd_build
	cicd_build cicd_build;
|};

public type cd_build record {|
    readonly int id;
    int cd_build_id;
    string cd_status;
    string customer;
    string event_timestamp;

    // many-to-one relationship with cicd_build
	cicd_build cicd_build;
|};