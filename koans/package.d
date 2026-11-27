module koans;

// to test only one module
// static immutable koansModules = ["ref_functions"];

static immutable koansModules = [
    "basics", "numbers", "chars", "strings",
    "bitwise_operators", "enums", "arrays",
    "associative_arrays", "foreach_loop", 
    "structs", "unions",  "function_parameters", 
    "classes", "properties",  "pointers", 
    "ref_functions", "exceptions", "ctfe", "files",
    "templates", "mixins", "tuples", "traits",
    "delegates", "c_interop", "alias_this",
    "operator_overloading", "lambda_syntax", 
    "concurrency",
    "ranges", "const_immutable", "static_if_version", "attributes",
    "scope_guards", "contracts",
];


static foreach (m; koansModules)
    mixin("public static import koans." ~ m ~ ";");
