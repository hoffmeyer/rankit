module Paths_rankit (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hoffmeyer/Development/rankit/.stack-work/install/x86_64-osx/lts-3.3/7.10.2/bin"
libdir     = "/Users/hoffmeyer/Development/rankit/.stack-work/install/x86_64-osx/lts-3.3/7.10.2/lib/x86_64-osx-ghc-7.10.2/rankit-0.1-LPol1x9rbEU4LoToW2Zhhz"
datadir    = "/Users/hoffmeyer/Development/rankit/.stack-work/install/x86_64-osx/lts-3.3/7.10.2/share/x86_64-osx-ghc-7.10.2/rankit-0.1"
libexecdir = "/Users/hoffmeyer/Development/rankit/.stack-work/install/x86_64-osx/lts-3.3/7.10.2/libexec"
sysconfdir = "/Users/hoffmeyer/Development/rankit/.stack-work/install/x86_64-osx/lts-3.3/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "rankit_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "rankit_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "rankit_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rankit_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rankit_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
