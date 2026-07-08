## Virtual environment
- The code is in a Pixi workspace.

## Coding style
- Write code with an emphasis on simplicity and readability.
- Code should be accessible to review by a junior analyst
- Avoiding deep nesting or obscure "tricks".
- Keep scripts and function short.
  - Aim to keep scripts < 100 lines.
  - Aim to keep functions < 30 lines.
- Favour a functional coding style.

## Pandas coding style
- You must always use method chains
- Favour `ab_utils.read()` over `pd.read_csv()`
- Always use the `validate` argument with merges.

## Pandas checks and assertions
- You must use the pandas_checks library extensively.
- You must use the `.check` accessor frequently, for example:
  - To check the shape of the data after any transformation, filter, or merge
  - To check for unique values in specific subsets of the data after any transformation, filter, or merge
  - To check for duplicates in newly loaded or merged data
- You must use the `.check.assert_*` methods to sanity-check pandas objects after any transformation.
  - For example, use `.check.assert_data(lambda df: <condition>, fail_message="...")` for custom boolean assertions.

## Matplotlib coding style
- Prefer `axes.annotate()` over `axes.text()`
- Always express figure sizes in centimetres (divide inches by 2.54)

## Statistics
- You must calculate odds ratios using the `statsmodels.stats.contingency_tables.Table2x2` class. This applies Haldane-Anscombe correction by default.
