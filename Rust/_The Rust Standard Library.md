
## Primitive Types

|Type|Description (EN)|Opis (PL)|
|---|---|---|
|`array`|Fixed‑size array `[T; N]`.|Tablica o stałym rozmiarze `[T; N]`.|
|`bool`|Boolean (`true` / `false`).|Typ logiczny (`true` / `false`).|
|`char`|Unicode scalar value.|Znak Unicode.|
|`f32`|32‑bit IEEE‑754 binary32 float.|32‑bitowa liczba zmiennoprzecinkowa (binary32).|
|`f64`|64‑bit IEEE‑754 binary64 float.|64‑bitowa liczba zmiennoprzecinkowa (binary64).|
|`fn`|Function pointer, e.g. `fn(usize) -> bool`.|Wskaźnik do funkcji, np. `fn(usize) -> bool`.|
|`i8`|8‑bit signed integer.|8‑bitowa liczba całkowita ze znakiem.|
|`i16`|16‑bit signed integer.|16‑bitowa liczba całkowita ze znakiem.|
|`i32`|32‑bit signed integer.|32‑bitowa liczba całkowita ze znakiem.|
|`i64`|64‑bit signed integer.|64‑bitowa liczba całkowita ze znakiem.|
|`i128`|128‑bit signed integer.|128‑bitowa liczba całkowita ze znakiem.|
|`isize`|Pointer‑sized signed integer.|Liczba całkowita ze znakiem o rozmiarze wskaźnika.|
|`pointer`|Raw pointers `*const T` / `*mut T`.|Surowe wskaźniki `*const T` / `*mut T`.|
|`reference`|Borrowed references `&T` / `&mut T`.|Pożyczone referencje `&T` / `&mut T`.|
|`slice`|Dynamically‑sized view `[T]`.|Dynamiczny widok na ciąg `[T]`.|
|`str`|String slice (`&str`).|Szybki podział łańcucha znaków (`&str`).|
|`tuple`|Heterogeneous fixed‑size tuple `(T, U, …)`.|Heterogeniczna krotka o stałym rozmiarze `(T, U, …)`.|
|`u8`|8‑bit unsigned integer.|8‑bitowa liczba całkowita bez znaku.|
|`u16`|16‑bit unsigned integer.|16‑bitowa liczba całkowita bez znaku.|
|`u32`|32‑bit unsigned integer.|32‑bitowa liczba całkowita bez znaku.|
|`u64`|64‑bit unsigned integer.|64‑bitowa liczba całkowita bez znaku.|
|`u128`|128‑bit unsigned integer.|128‑bitowa liczba całkowita bez znaku.|
|`unit`|Unit type `()`.|Typ jednostkowy `()`.|
|`usize`|Pointer‑sized unsigned integer.|Liczba całkowita bez znaku o rozmiarze wskaźnika.|
|`f16Experimental`|16‑bit IEEE‑754 binary16 float (experimental).|16‑bitowa liczba zmiennoprzecinkowa (binary16) – eksperymentalna.|
|`f128Experimental`|128‑bit IEEE‑754 binary128 float (experimental).|128‑bitowa liczba zmiennoprzecinkowa (binary128) – eksperymentalna.|
|`neverExperimental`|Never type `!` (experimental).|Typ „never” `!` – eksperymentalny.|


## Standard Library Modules

| Module                        | Description (EN)                              | Opis (PL)                                           |
| ----------------------------- | --------------------------------------------- | --------------------------------------------------- |
| `alloc`                       | Memory allocation APIs.                       | Interfejsy alokacji pamięci.                        |
| `any`                         | Dynamic typing / type reflection utilities.   | Narzędzia do typów dynamicznych i refleksji.        |
| `arch`                        | SIMD and vendor intrinsics.                   | SIMD i intrinsics dostawców.                        |
| `array`                       | Helpers for the array primitive.              | Pomocnicze funkcje dla typu tablicowego.            |
| `ascii`                       | ASCII string/character ops.                   | Operacje na łańcuchach i znakach ASCII.             |
| `backtrace`                   | Capture OS thread stack backtraces.           | Pobieranie backtrace’u stosu wątków OS.             |
| `borrow`                      | Working with borrowed data.                   | Praca z pożyczonymi danymi.                         |
| `boxed`                       | Heap‑allocated `Box<T>`.                      | Alokacja na stercie – `Box<T>`.                     |
| `cell`                        | Shareable mutable containers.                 | Współdzielone mutowalne kontenery.                  |
| `char`                        | Utilities for the `char` primitive.           | Narzędzia dla typu `char`.                          |
| `clone`                       | `Clone` trait definition.                     | Definicja cechy `Clone`.                            |
| `cmp`                         | Comparison and ordering utilities.            | Narzędzia porównywania i sortowania.                |
| `collections`                 | Collection types (Vec, HashMap, …).           | Typy kolekcji (Vec, HashMap, …).                    |
| `convert`                     | Conversion traits.                            | Cechy konwersji.                                    |
| `default`                     | `Default` trait.                              | Cecha `Default`.                                    |
| `env`                         | Process environment inspection/manipulation.  | Inspekcja i modyfikacja środowiska procesu.         |
| `error`                       | Error handling interfaces.                    | Interfejsy obsługi błędów.                          |
| `f32`                         | Constants for `f32`.                          | Stałe dla `f32`.                                    |
| `f64`                         | Constants for `f64`.                          | Stałe dla `f64`.                                    |
| `ffi`                         | Foreign‑function interface helpers.           | Pomoc przy interfejsie FFI.                         |
| `fmt`                         | Formatting and printing utilities (`String`). | Narzędzia formatowania i wypisywania (`String`).    |
| `fs`                          | Filesystem operations.                        | Operacje na systemie plików.                        |
| `future`                      | Asynchronous basics.                          | Podstawy programowania asynchronicznego.            |
| `hash`                        | Generic hashing support.                      | Ogólne wsparcie dla haszowania.                     |
| `hint`                        | Compiler hints for optimization.              | Wskazówki dla kompilatora w celu optymalizacji.     |
| `i8` (Deprecation planned)    | Redundant constants for `i8`.                 | Nadmiarowe stałe dla `i8`.                          |
| `i16` (Deprecation planned)   | Redundant constants for `i16`.                | Nadmiarowe stałe dla `i16`.                         |
| `i32` (Deprecation planned)   | Redundant constants for `i32`.                | Nadmiarowe stałe dla `i32`.                         |
| `i64` (Deprecation planned)   | Redundant constants for `i64`.                | Nadmiarowe stałe dla `i64`.                         |
| `i128` (Deprecation planned)  | Redundant constants for `i128`.               | Nadmiarowe stałe dla `i128`.                        |
| `io`                          | Core I/O traits and helpers.                  | Główne cechy i pomocnicze funkcje I/O.              |
| `isize` (Deprecation planned) | Redundant constants for `isize`.              | Nadmiarowe stałe dla `isize`.                       |
| `iter`                        | External iteration combinators.               | Kombinatory iteracji zewnętrznej.                   |
| `marker`                      | Primitive marker traits/types.                | Podstawowe cechy i typy markerów.                   |
| `mem`                         | Low‑level memory functions.                   | Funkcje niskopoziomowej manipulacji pamięcią.       |
| `net`                         | TCP/UDP networking primitives.                | Podstawowe elementy sieci TCP/UDP.                  |
| `num`                         | Additional numeric utilities.                 | Dodatkowe narzędzia numeryczne.                     |
| `ops`                         | Overloadable operator traits.                 | Cecha umożliwiająca przeciążanie operatorów.        |
| `option`                      | `Option<T>` type.                             | Typ `Option<T>`.                                    |
| `os`                          | OS‑specific functionality.                    | Specyficzne dla systemu operacyjnego funkcje.       |
| `panic`                       | Panic support.                                | Obsługa paniki.                                     |
| `path`                        | Cross‑platform path handling.                 | Obsługa ścieżek wieloplatformowych.                 |
| `pin`                         | Pinning API for self‑referential structs.     | API „pinning” dla struktur samoodwołujących się.    |
| `prelude`                     | The Rust prelude.                             | Preludium języka Rust.                              |
| `primitive`                   | Re‑exports primitive types.                   | Ponowne eksportowanie typów prymitywnych.           |
| `process`                     | Process‑related utilities.                    | Narzędzia związane z procesami.                     |
| `ptr`                         | Raw pointer manipulation.                     | Manipulacja surowymi wskaźnikami.                   |
| `rc`                          | Single‑threaded reference counting (`Rc`).    | Liczenie referencji w jednym wątku (`Rc`).          |
| `result`                      | `Result<T, E>` type.                          | Typ `Result<T, E>`.                                 |
| `slice`                       | Slice utilities.                              | Narzędzia dla slice’y.                              |
| `str`                         | String slice utilities.                       | Narzędzia dla `str`.                                |
| `string`                      | Growable UTF‑8 `String`.                      | Rozrastający się łańcuch UTF‑8 (`String`).          |
| `sync`                        | Synchronization primitives.                   | Elementy synchronizacji.                            |
| `task`                        | Async task types/traits.                      | Typy i cechy zadań asynchronicznych.                |
| `thread`                      | Native threading.                             | Wątkowanie natywne.                                 |
| `time`                        | Temporal measurement.                         | Pomiar czasu.                                       |
| `u8` (Deprecation planned)    | Redundant constants for `u8`.                 | Nadmiarowe stałe dla `u8`.                          |
| `u16` (Deprecation planned)   | Redundant constants for `u16`.                | Nadmiarowe stałe dla `u16`.                         |
| `u32` (Deprecation planned)   | Redundant constants for `u32`.                | Nadmiarowe stałe dla `u32`.                         |
| `u64` (Deprecation planned)   | Redundant constants for `u64`.                | Nadmiarowe stałe dla `u64`.                         |
| `u128` (Deprecation planned)  | Redundant constants for `u128`.               | Nadmiarowe stałe dla `u128`.                        |
| `usize` (Deprecation planned) | Redundant constants for `usize`.              | Nadmiarowe stałe dla `usize`.                       |
| `vec`                         | Growable heap‑allocated vector `Vec<T>`.      | Rozrastający się wektor na stercie `Vec<T>`.        |
| `assert_matchesExperimental`  | Unstable `assert_matches!` macro.             | Niestabilna makro `assert_matches!`.                |
| `async_iterExperimental`      | Asynchronous iteration combinators.           | Kombinatory iteracji asynchronicznej.               |
| `autodiffExperimental`        | Automatic differentiation support.            | Wsparcie dla automatycznej różniczkowania.          |
| `bstrExperimental`            | Byte string types (`ByteStr`, `ByteString`).  | Typy łańcuchów bajtowych (`ByteStr`, `ByteString`). |
| `f16Experimental`             | Constants for half‑precision float.           | Stałe dla liczby półprecyzyjnej (half‑precision).   |
| `f128Experimental`            | Constants for quad‑precision float.           | Stałe dla liczby kwadruple‑precision.               |
| `intrinsicsExperimental`      | Compiler intrinsics.                          | Intrinsic‑y kompilatora.                            |
| `patExperimental`             | Macro for `pattern_type`.                     | Makro dla `pattern_type`.                           |
| `randomExperimental`          | Random value generation.                      | Generowanie losowych wartości.                      |
| `rangeExperimental`           | Experimental range types.                     | Eksperymentalne typy zakresów.                      |
| `simdExperimental`            | Portable SIMD module.                         | Przenośny moduł SIMD.                               |
| `unsafe_binderExperimental`   | Unsafe binder conversion helpers.             | Pomoc przy konwersjach niebezpiecznych binderów.    |

## Macros

|Macro|Purpose (EN)|Cel (PL)|
|---|---|---|
|`assert`|Runtime assertion (`true`).|Assercja w czasie wykonywania (`true`).|
|`assert_eq`|Assert equality (`PartialEq`).|Assercja równości (`PartialEq`).|
|`assert_ne`|Assert inequality.|Assercja nierówności.|
|`cfg`|Compile‑time config flag evaluation.|Ocena flag konfiguracyjnych w czasie kompilacji.|
|`column`|Expands to source column number.|Rozwija się do numeru kolumny w kodzie źródłowym.|
|`compile_error`|Force compilation failure with a message.|Wymusza błąd kompilacji z komunikatem.|
|`concat`|Concatenate literals into a static `&'static str`.|Łączy literały w statyczny `&'static str`.|
|`dbg`|Debug‑print an expression and return it.|Drukuje wyrażenie w trybie debug i zwraca je.|
|`debug_assert`|Runtime debug‑only assertion.|Assercja dostępna tylko w trybie debug.|
|`debug_assert_eq`|Debug assert equality.|Assercja równości w trybie debug.|
|`debug_assert_ne`|Debug assert inequality.|Assercja nierówności w trybie debug.|
|`env`|Inspect env var at compile time.|Sprawdza zmienną środowiskową w czasie kompilacji.|
|`eprint`|Print to stderr.|Wypisuje na `stderr`.|
|`eprintln`|Print to stderr with newline.|Wypisuje na `stderr` z nową linią.|
|`file`|Expand to current file name.|Rozwija się do nazwy bieżącego pliku.|
|`format`|Build a `String` via interpolation.|Tworzy `String` przez interpolację.|
|`format_args`|Construct arguments for other formatting macros.|Buduje argumenty dla innych makr formatowania.|
|`include`|Include a file as an expression/item.|Dołącza plik jako wyrażenie lub element.|
|`include_bytes`|Include a file as a `&'static [u8]`.|Dołącza plik jako `&'static [u8]`.|
|`include_str`|Include a UTF‑8 file as `&'static str`.|Dołącza plik UTF‑8 jako `&'static str`.|
|`is_x86_feature_detected`|Runtime check for x86 CPU features.|Sprawdza w czasie działania cechy CPU x86.|
|`line`|Expand to source line number.|Rozwija się do numeru linii w kodzie.|
|`matches`|Test if a value matches a pattern.|Testuje, czy wartość pasuje do wzorca.|
|`module_path`|Expand to current module path.|Rozwija się do ścieżki bieżącego modułu.|
|`option_env`|Optionally inspect env var at compile time.|Opcjonalnie sprawdza zmienną środowiskową w czasie kompilacji.|
|`panic`|Trigger a panic.|Wywołuje panikę.|
|`print`|Print to stdout.|Wypisuje na `stdout`.|
|`println`|Print to stdout with newline.|Wypisuje na `stdout` z nową linią.|
|`stringify`|Convert tokens to a string literal.|Konwertuje tokeny na literał łańcucha znaków.|
|`thread_local`|Declare thread‑local storage.|Deklaruje pamięć lokalną dla wątku.|
|`todo`|Mark unfinished code (panics).|Oznacza nieukończony kod (panika).|
|`try` (Deprecated)|Propagate errors (`?` style).|Propaguje błędy (styl `?`).|
|`unimplemented`|Indicate unimplemented code (panics).|Informuje o niezaimplementowanym kodzie (panika).|
|`unreachable`|Indicate unreachable code (panics).|Informuje o nieosiągalnym kodzie (panika).|
|`vec`|Create a `Vec<T>` from elements.|Tworzy `Vec<T>` z podanych elementów.|
|`write`|Write formatted data into a buffer.|Zapisuje sformatowane dane do bufora.|
|`writeln`|Write formatted data + newline into a buffer.|Zapisuje sformatowane dane + nową linię do bufora.|
|`cfg_selectExperimental`|Compile‑time selection based on predicates.|Selekcja w czasie kompilacji na podstawie predykatów.|
|`concat_bytesExperimental`|Concatenate byte literals.|Łączy literały bajtowe.|
|`const_format_argsExperimental`|`format_args` usable in const contexts.|`format_args` używalny w kontekstach stałych.|
|`format_args_nlExperimental`|`||

