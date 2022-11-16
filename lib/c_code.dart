//REVIEW - this class contains helpers codes to macke code more clean

T conditionGetter<T>(bool condition, T whileTrue, T whileFalse) =>
    condition ? whileTrue : whileFalse;
