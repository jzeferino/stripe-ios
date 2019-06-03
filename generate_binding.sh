# Create binding classes

echo "*******************************************"
echo "Running sharpie to generate binding classes"
echo "*******************************************"

sharpie bind -sdk iphoneos12.2 -output tmp_generated -namespace Xamarin.iOS.Stripe -scope Stripe/PublicHeaders  Stripe/PublicHeaders/*.h -c IStripe/PublicHeaders/
