# Sample Test That Has ComboBoxApi Somewhere

- Prefer to use methods found in 'app/test-utils/helpers/index.js'
- Look at 'app/javascript/react/test-utils/helpers/test_setup.js' for specifics.

```javascript
import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import { createResponse, pageLoader, mockNotify } from 'app/test-utils/helpers';
import Component from './Component';

const mockData = [
  { id: '1', name: 'Board 1' },
  { id: '2', name: 'Board 2' },
];

describe('Component', () => {
  beforeEach(() =>
    fetch.resetMocks();
    jest.clearAllMocks();
fetch.mockImplementation((url) => {
  console.log('Fetched URL:', url);
  return createResponse(mockData);
});
  mockNotify();
  });

  it('renders with custom URL', async () => {
    const testUrl = '/api/boards';

    await pageLoader(() => {
      render(<Component url={testUrl} />);
    });

    const button = screen.getByRole('button', { name: 'Open' });
    fireEvent.click(button);

    expect(screen.getAllByRole('option').length).toEqual(2);
    expect(screen.getByRole('option', { name: '1 (Board 1)' })).toBeInTheDocument();
    expect(screen.getByRole('option', { name: '2 (Board 2)' })).toBeInTheDocument();

    expect(fetch).toHaveBeenCalledWith(testUrl);
  });
});
```
