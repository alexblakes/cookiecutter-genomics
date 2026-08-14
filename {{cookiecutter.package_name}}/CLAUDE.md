## Environment and commands
- The code is in a Pixi workspace. Run everything via `pixi run`; the environment is not auto-activated.
- `pixi run smk` runs the workflow. Dry run with `pixi run snakemake -n` before executing.
- `pixi run fmt` runs ruff and snakefmt. Run it after editing code.
- There is no test suite. The pandas checks below are the verification mechanism.

## Coding style
- Use the stubs in `.vscode/*.code-snippets` as the starting point for any Python, Snakemake, or bash script.
- Write code with an emphasis on simplicity and readability.
- Code should be accessible to review by a junior analyst
- Avoiding deep nesting or obscure "tricks".
- Keep scripts and function short.
  - Target scripts < 100 lines.
  - Target functions < 30 lines.
- Favour a functional coding style.

## Pandas coding style
- When writing Pandas code you must always use method chains
- Favour `ab_utils.read()` over `pd.read_csv()`. It reads TSV by default and logs the row count.
- Always use the `validate` argument with merges.

## Pandas checks and assertions
- You must use the pandas_checks library extensively.
- You must use the `.check` accessor frequently, for example:
  - To check the shape of the data after loading, or after any transformation, filter, or merge
  - To check for unique values in relevant subsets of the data after any transformation, filter, or merge
  - To check for duplicates in newly loaded or merged data
- You must use the `.check.assert_*` methods to sanity-check pandas objects after loading data, or after any transformation
  - For example, use `.check.assert_data(lambda df: <condition>, fail_message="...")` for custom boolean assertions.

## Matplotlib coding style
- Prefer `axes.annotate()` over `axes.text()`
- Always express figure sizes in centimetres (divide inches by 2.54)
- Use separate scripts for data manipulation and plotting.

## Statistics
- When calculating odds ratios, use the `statsmodels.stats.contingency_tables.Table2x2` class. This applies Haldane-Anscombe correction by default.
