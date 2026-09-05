# DLangKoans - Developer & Agent Instructions

This document provides foundational context, architectural overviews, and developmental instructions for **DLangKoans**, an educational unit test suite for learning the D Programming Language.

---

## 1. Project Overview

**DLangKoans** is a koans-style learning project for the D Programming Language. It uses unit tests (`unittest` blocks) as exercises. The user progresses by solving assertion failures one by one.

### Technical Stack & Key Files
- **Language:** D (Dlang)
- **Compiler:** DMD (usually, or LDC/GDC)
- **Build System & Package Manager:** `dub` (configured via `dub.json`)
- **Static Analysis:** DScanner (configured via `dscanner.ini`)
- **Main Entry Point:** `learn.d`
- **Exercises Directory:** `koans/`
- **Module Orchestration:** `koans/package.d`
- **Placeholders / Helpers:** `koans/helpers.d`

---

## 2. Architecture & Execution Flow

Unlike typical D projects where the compiler/runner executes all unit tests simultaneously and exits, DLangKoans runs koans **sequentially and incrementally**:

1. **Test Runner Override:**
   In `learn.d`, `Runtime.moduleUnitTester` is overridden:
   ```d
   shared static this()
   {
       // Override the default unit test runner to do nothing.
       // After that, "main" will be called.
       Runtime.moduleUnitTester = { return true; };
   }
   ```
2. **Koans Sequencing:**
   The `main()` function iterates over the `koansModules` array declared in `koans/package.d`.
3. **Execution & Failure Catching:**
   For each module, the runner uses runtime reflection (`__traits(getUnitTests)`) to extract and execute `unittest` blocks.
   If an assertion fails (`core.exception.AssertError` is thrown), the runner intercepts it, prints the failure file and line, and terminates immediately:
   ```d
   catch (core.exception.AssertError e)
   {
       writeln("Meditate more on ", e.file, " at line ", e.line);
       return;
   }
   ```
   This ensures the learner focuses on exactly one failing exercise at a time.

---

## 3. Building, Running & Testing

Use the following commands to interact with the project:

### Run / Test the Koans
Executes the main suite to run koans sequentially:
```bash
dub --build=unittest
```
Alternatively, use the shell wrapper:
```bash
./runkoans.sh
```

### Continuous Development / Watch Mode
Automatically re-run the koans whenever source files are updated.
- **Linux** (requires `inotify-tools`):
  ```bash
  ./scripts/runner_linux.sh
  ```
- **macOS** (requires `fswatch`):
  ```bash
  ./scripts/runner_osx.sh
  ```

---

## 4. Development & Koan Contributions

### The Placeholder System (`koans/helpers.d`)
Koans are composed of assertions containing intentionally incorrect default values (placeholders) imported from `koans.helpers`. Learn how these are structured:
- `FILL_IN_THIS_CHAR` (char) - Default: `' '`
- `FILL_IN_THIS_NUMBER` (int) - Default: `42`
- `FILL_IN_THIS_STRING` (string) - Default: `"__a random string__"`
- `FILL_IN_THIS_DECIMAL` (double) - Default: `3.141592`
- `FILL_IN_TRUE_OR_FALSE` (bool) - Default: `false`
- `FILL_IN_THIS_ARRAY` (int[]) - Default: `[42, 42, 42, 42, 42]`

### How to Create or Modify a Koan File
To add a new koan topic:
1. **Create the file** in `koans/` (e.g., `koans/my_new_topic.d`).
2. **Define the module name** matching the file hierarchy:
   ```d
   module koans.my_new_topic;
   import koans.helpers;
   
   unittest
   {
       assert(1 + 1 == FILL_IN_THIS_NUMBER);
   }
   ```
3. **Register the module** in `koans/package.d` inside the `koansModules` array in your desired progression order.
4. **Isolate a specific module** (for debugging/development):
   In `koans/package.d`, you can temporarily override the `koansModules` array to list only the module you are working on:
   ```d
   static immutable koansModules = ["my_new_topic"];
   ```

---

## 5. Coding & Linting Conventions

- **Linting:** Static checks can be configured or run with DScanner using the `dscanner.ini` file located at the project root.
- **D Style Guidelines:** Adhere to Phobos style guide rules (PascalCase for struct/class names, camelCase for functions/variables, lower_snake_case is occasionally used in koan naming where appropriate).
