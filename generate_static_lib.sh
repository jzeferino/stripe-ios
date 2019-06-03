echo "************************"
echo "Compiling static library"
echo "************************"

make clean
make

echo "************************************************"
echo "Copying static library to src/Xamarin.iOS.Stripe"
echo "************************************************"

cp libStripe.a ../src/Xamarin.iOS.Stripe
rm *.a
