{ mkDerivation, aeson, attoparsec, base, bytestring
, containers, deepseq, directory, filepath
, optparse-applicative, parallel
, process, QuickCheck, text, transformers
, vector, lib, pandoc
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
  prePatch = ''
    ${pandoc}/bin/pandoc -s -t man docs/hops.md -o hops.1
    rm -f Makefile
  '';
  postInstall = ''
    mkdir -p $out/share/man/man1
    cp hops.1 $out/share/man/man1/
  '';
  homepage = "http://akc.is/hops";
  description = "Handy Operations on Power Series";
  license = lib.licenses.bsd3;
}
