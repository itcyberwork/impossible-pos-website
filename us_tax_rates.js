// US State Base Sales Tax Rates for Software Licensing and POS Hardware (All 50 US States + DC)
(function(root) {
  const US_STATE_TAX_RATES = {
    AL: { name: 'Alabama', rate: 0.0400 },
    AK: { name: 'Alaska', rate: 0.0000, taxFree: true },
    AZ: { name: 'Arizona', rate: 0.0560 },
    AR: { name: 'Arkansas', rate: 0.0650 },
    CA: { name: 'California', rate: 0.0725 },
    CO: { name: 'Colorado', rate: 0.0290 },
    CT: { name: 'Connecticut', rate: 0.0635 },
    DE: { name: 'Delaware', rate: 0.0000, taxFree: true },
    DC: { name: 'District of Columbia', rate: 0.0600 },
    FL: { name: 'Florida', rate: 0.0600 },
    GA: { name: 'Georgia', rate: 0.0400 },
    HI: { name: 'Hawaii', rate: 0.0400 },
    ID: { name: 'Idaho', rate: 0.0600 },
    IL: { name: 'Illinois', rate: 0.0625 },
    IN: { name: 'Indiana', rate: 0.0700 },
    IA: { name: 'Iowa', rate: 0.0600 },
    KS: { name: 'Kansas', rate: 0.0650 },
    KY: { name: 'Kentucky', rate: 0.0600 },
    LA: { name: 'Louisiana', rate: 0.0445 },
    ME: { name: 'Maine', rate: 0.0550 },
    MD: { name: 'Maryland', rate: 0.0600 },
    MA: { name: 'Massachusetts', rate: 0.0625 },
    MI: { name: 'Michigan', rate: 0.0600 },
    MN: { name: 'Minnesota', rate: 0.06875 },
    MS: { name: 'Mississippi', rate: 0.0700 },
    MO: { name: 'Missouri', rate: 0.04225 },
    MT: { name: 'Montana', rate: 0.0000, taxFree: true },
    NE: { name: 'Nebraska', rate: 0.0550 },
    NV: { name: 'Nevada', rate: 0.0685 },
    NH: { name: 'New Hampshire', rate: 0.0000, taxFree: true },
    NJ: { name: 'New Jersey', rate: 0.06625 },
    NM: { name: 'New Mexico', rate: 0.0500 },
    NY: { name: 'New York', rate: 0.0400 },
    NC: { name: 'North Carolina', rate: 0.0475 },
    ND: { name: 'North Dakota', rate: 0.0500 },
    OH: { name: 'Ohio', rate: 0.0575 },
    OK: { name: 'Oklahoma', rate: 0.0450 },
    OR: { name: 'Oregon', rate: 0.0000, taxFree: true },
    PA: { name: 'Pennsylvania', rate: 0.0600 },
    RI: { name: 'Rhode Island', rate: 0.0700 },
    SC: { name: 'South Carolina', rate: 0.0600 },
    SD: { name: 'South Dakota', rate: 0.0420 },
    TN: { name: 'Tennessee', rate: 0.0700 },
    TX: { name: 'Texas', rate: 0.0625 },
    UT: { name: 'Utah', rate: 0.0610 },
    VT: { name: 'Vermont', rate: 0.0600 },
    VA: { name: 'Virginia', rate: 0.0530 },
    WA: { name: 'Washington', rate: 0.0650 },
    WV: { name: 'West Virginia', rate: 0.0600 },
    WI: { name: 'Wisconsin', rate: 0.0500 },
    WY: { name: 'Wyoming', rate: 0.0400 },
    EXEMPT: { name: 'Tax-Exempt / Out of USA', rate: 0.0000, taxFree: true }
  };

  function getTaxRate(stateCode) {
    if (!stateCode) return US_STATE_TAX_RATES['MI'];
    const code = String(stateCode).trim().toUpperCase();
    return US_STATE_TAX_RATES[code] || US_STATE_TAX_RATES['MI'];
  }

  function calculateStateTax(amount, stateCode) {
    const taxInfo = getTaxRate(stateCode);
    const taxAmount = Math.round((amount * taxInfo.rate) * 100) / 100;
    const total = Math.round((amount + taxAmount) * 100) / 100;
    return {
      stateCode: stateCode || 'MI',
      stateName: taxInfo.name,
      rate: taxInfo.rate,
      ratePercent: (taxInfo.rate * 100).toFixed(taxInfo.rate % 0.01 === 0 ? 1 : 2) + '%',
      taxFree: !!taxInfo.taxFree,
      subtotal: amount,
      taxAmount: taxAmount,
      total: total
    };
  }

  function populateStateDropdown(selectElementId, defaultCode = 'MI') {
    const el = document.getElementById(selectElementId);
    if (!el) return;
    el.innerHTML = '';
    
    // Sort states alphabetically by name, keeping EXEMPT at the end
    const keys = Object.keys(US_STATE_TAX_RATES).sort((a, b) => {
      if (a === 'EXEMPT') return 1;
      if (b === 'EXEMPT') return -1;
      return US_STATE_TAX_RATES[a].name.localeCompare(US_STATE_TAX_RATES[b].name);
    });

    keys.forEach(k => {
      const item = US_STATE_TAX_RATES[k];
      const opt = document.createElement('option');
      opt.value = k;
      const rateStr = item.taxFree ? 'No Tax (0%)' : `${(item.rate * 100).toFixed(item.rate % 0.01 === 0 ? 1 : 2)}%`;
      opt.text = `${k} - ${item.name} (${rateStr})`;
      if (k === defaultCode.toUpperCase()) opt.selected = true;
      el.appendChild(opt);
    });
  }

  const exported = {
    RATES: US_STATE_TAX_RATES,
    getTaxRate,
    calculateStateTax,
    populateStateDropdown
  };

  if (typeof module !== 'undefined' && module.exports) {
    module.exports = exported;
  } else {
    root.USTaxRates = exported;
  }
})(typeof window !== 'undefined' ? window : this);
