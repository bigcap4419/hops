{ mkDerivation, aeson, attoparsec, base, bytestring
, containers, deepseq, directory, filepath
, optparse-applicative, parallel
, process, QuickCheck, text, transformers
, vector, lib
}:
mkDerivation {
  pname = "hops";
  version = "0.8.5";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    aeson attoparsec base bytestring
    containers directory filepath
    optparse-applicative text transformers
    vector
  ];
  executableHaskellDepends = [
    aeson base bytestring
    containers deepseq directory
    parallel
  ];
  testHaskellDepends = [
    base bytestring containers
    process QuickCheck vector
  ];
  homepage = "http://akc.is/hops";
  description = "Handy Operations on Power Series";
  license = lib.licenses.bsd3;
}
