var REG_NONE = NewRegistrar('none');
var DSP_CLOUDFLARE = NewDnsProvider('cloudflare');

// Example domain where the CF proxy abides by the default (off).
D(
	'DOMAIN',
	REG_NONE,
	DnsProvider(DSP_CLOUDFLARE),
	TXT('_25._tcp', 'HASH'),
	END
);
