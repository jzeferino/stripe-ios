# Fix binding code issues

echo "*********************************"
echo "Running atuomated binding patches"
echo "*********************************"

# Replaces uint and nint

sed -i '' 's/nuint/ulong/g' tmp_generated/StructsAndEnums.cs
sed -i '' 's/nint/long/g' tmp_generated/StructsAndEnums.cs

# Replace unsuported platform

sed -i '' 's/.iOSAppExtension/.iOS/g' tmp_generated/ApiDefinitions.cs
sed -i '' 's/.MacOSXAppExtension/.MacOSX/g' tmp_generated/ApiDefinitions.cs

# Replaces Verifies

sed -E -i '' 's/\[Verify *\((.*)\)\]/[Introduced(PlatformName.None, message: "\1")]/' tmp_generated/ApiDefinitions.cs

# Replaces deprecated

sed -E -i '' 's/^((.*)\/\/.*__attribute__\(\(deprecated\("([^"]*)".*\)\)\).*)/\1\
\2[Deprecated(PlatformName.None, message: "\3")]/' tmp_generated/ApiDefinitions.cs


# Copy final files

echo "***********************************************************"
echo "Copying generated binding patches to src/Xamarin.iOS.Stripe"
echo "***********************************************************"

cp -a tmp_generated/ ../src/Xamarin.iOS.Stripe/
rm -rf tmp_generated/